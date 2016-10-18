package com.genelol.service.riotgames;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.genelol.dao.riotgames.RiotGamesDao;

import net.rithms.riot.dto.Champion.Champion;
import net.rithms.riot.dto.Game.Game;
import net.rithms.riot.dto.Game.Player;
import net.rithms.riot.dto.Game.RecentGames;
import net.rithms.riot.dto.League.League;
import net.rithms.riot.dto.Stats.ChampionStats;
import net.rithms.riot.dto.Stats.RankedStats;
import net.rithms.riot.dto.Summoner.Summoner;

@Service
public class RiotGamesServiceImp implements RiotGamesService {

	@Autowired
	private RiotGamesDao riotGamesDao;

	private final String[] apiKey = { "RGAPI-d41b0fc3-2198-4949-a3fc-72e2c0eba88d",
			"RGAPI-6A2DC49C-4A25-4A41-94A0-6593D7980BC4", "RGAPI-B059F48C-4BBD-42B8-A170-80245EF8C48F",
			"RGAPI-611601E0-6B4C-4806-AF45-1FF12B2BC1A5" };

	@Override
	public ArrayList<Game> getRecentRocordBySummonerID(long summonerID) {

		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		ArrayList<Game> matchDetailList = new ArrayList<>();
		String recentGameURL = "https://kr.api.pvp.net/api/lol/kr/v1.3/game/by-summoner/" + summonerID + "/recent/";

		try {

			URI uri = new URI(recentGameURL);
			RecentGames recentGames = mapper.readValue(getEntity(uri, 0), RecentGames.class);

			for (Game game : recentGames.getGames()) {
				matchDetailList.add(game);
			}

		} catch (URISyntaxException e) {
			e.printStackTrace();
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return matchDetailList;
	}

	@Override
	public String getEntity(URI uri, int apiIndex) {
		String content = "";
		try {
			uri = new URIBuilder(uri).addParameter("api_key", apiKey[apiIndex]).build();
			HttpClient httpClient = HttpClientBuilder.create().build();
			HttpResponse httpResponse = httpClient.execute(new HttpGet(uri));
			HttpEntity entity = httpResponse.getEntity();
			content = EntityUtils.toString(entity);
			if (content.trim().contains("\"status_code\": 429")) {
				if (apiIndex >= apiKey.length - 1) {
					apiIndex = 0;

				} else {
					apiIndex += 1;
				}
				content = getEntity(uri, apiIndex);
			} else {
				System.out.println(content);
			}

		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		return content;
	}

	@Override
	public Summoner getSummonerBySummonerName(String summonerName) {
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		Summoner summoner = new Summoner();
		String summonerIDURL = "https://kr.api.pvp.net/api/lol/kr/v1.4/summoner/by-name/"
				+ summonerName.replace(" ", "");

		try {

			URI uri = new URI(summonerIDURL);

			String summonerStr = getEntity(uri, 0).substring(5 + summonerName.replace(" ", "").length());
			summonerStr = "{" + summonerStr.substring(0, summonerStr.length() - 2) + "}";
			summoner = mapper.readValue(summonerStr, Summoner.class);

			if (riotGamesDao.getSummoner(summoner.getId()) == null) {
				riotGamesDao.insertSummoner(summoner);
			}

		} catch (URISyntaxException e) {
			e.printStackTrace();
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return summoner;
	}

	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, Summoner> getSummonerBySummonerID(long summonerID) {
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		String summonerNameURL = "https://kr.api.pvp.net/api/lol/kr/v1.4/summoner/" + summonerID;
		HashMap<String, Summoner> summonerMap = new HashMap<>();

		Summoner summoner = riotGamesDao.getSummoner(summonerID);
		if (summoner == null) {
			try {
				URI uri = new URI(summonerNameURL);
				summonerMap = mapper.readValue(getEntity(uri, 0), HashMap.class);

				String summonerStr = (summonerMap.get(summonerID + "") + "").replace("id=", "\"id\":\"");
				summonerStr = summonerStr.replace("name=", "\"name\":\"");
				summonerStr = summonerStr.replace("profileIconId=", "\"profileIconId\":\"");
				summonerStr = summonerStr.replace("summonerLevel=", "\"summonerLevel\":\"");
				summonerStr = summonerStr.replace("revisionDate=", "\"revisionDate\":\"");
				summonerStr = summonerStr.replace(", ", "\",");
				summonerStr = summonerStr.replace("}", "\"}");

				summoner = mapper.readValue(summonerStr, Summoner.class);
				summonerMap.replace(summonerID + "", summoner);
				riotGamesDao.insertSummoner(summoner);

			} catch (URISyntaxException e) {
				e.printStackTrace();
			} catch (JsonParseException e) {
				e.printStackTrace();
			} catch (JsonMappingException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			summonerMap.put(summonerID + "", summoner);
		}
		return summonerMap;
	}

	@Override
	public HashMap<String, Summoner> getAllSummoner(ArrayList<Game> games) {
		HashMap<String, Summoner> players = new HashMap<>();

		for (Game game : games) {
			for (Player player : game.getFellowPlayers()) {
				if (players.containsKey(player.getSummonerId() + "")) {
					continue;
				} else {
					players.putAll(getSummonerBySummonerID(player.getSummonerId()));
				}
			}
		}
		return players;
	}

	@Override
	public League getLeagueEntryBySummonerID(long summonerID) {
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		String leagueEntryURL = "https://kr.api.pvp.net/api/lol/kr/v2.5/league/by-summoner/" + summonerID + "/entry";
		League league = new League();
		try {

			URI uri = new URI(leagueEntryURL);
			String leagueEntryStr = getEntity(uri, 0).substring(5 + (summonerID + "").length());
			leagueEntryStr = leagueEntryStr.substring(0, leagueEntryStr.length() - 2);
			league = mapper.readValue(leagueEntryStr, League.class);

		} catch (URISyntaxException e) {
			e.printStackTrace();
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return league;
	}

	@Override
	public RankedStats getRankedStatsBySummonerID(long summonerID, String season) {
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		String rankedStatsURL = "https://kr.api.pvp.net/api/lol/kr/v1.3/stats/by-summoner/" + summonerID + "/ranked";
		RankedStats rankedStats = new RankedStats();
		try {
			URI uri = new URI(rankedStatsURL);
			uri = new URIBuilder(uri).addParameter("season", season).build();
			rankedStats = mapper.readValue(getEntity(uri, 0), RankedStats.class);

			Collections.sort(rankedStats.getChampions(), new ChampionStatsDescCompare());

		} catch (URISyntaxException e) {
			e.printStackTrace();
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return rankedStats;
	}

	@Override
	public HashMap<String, Champion> getAllChampion(ArrayList<Game> games, String champData) {

		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		HashMap<String, Champion> champions = new HashMap<>();

		try {
			for (Game game : games) {
				String championURL = "https://global.api.pvp.net/api/lol/static-data/kr/v1.2/champion/"
						+ game.getChampionId();
				URI uri = new URI(championURL);
				uri = new URIBuilder(uri).addParameter("champData", champData).build();
				
			}

		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static class GameDescCompare implements Comparator<Game> {
		@Override
		public int compare(Game o1, Game o2) {
			return o1.getCreateDate() > o2.getCreateDate() ? -1 : o1.getCreateDate() > o2.getCreateDate() ? 1 : 0;
		}

	}

	public static class ChampionStatsDescCompare implements Comparator<ChampionStats> {
		@Override
		public int compare(ChampionStats o1, ChampionStats o2) {
			return o1.getStats().getTotalSessionsPlayed() > o2.getStats().getTotalSessionsPlayed() ? -1
					: o1.getStats().getTotalSessionsPlayed() > o2.getStats().getTotalSessionsPlayed() ? 1 : 0;
		}

	}

}
