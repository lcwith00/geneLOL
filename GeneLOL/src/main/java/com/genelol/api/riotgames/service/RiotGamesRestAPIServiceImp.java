package com.genelol.api.riotgames.service;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import net.rithms.riot.dto.Game.Game;
import net.rithms.riot.dto.Game.RecentGames;
import net.rithms.riot.dto.Summoner.Summoner;

@Service
public class RiotGamesRestAPIServiceImp implements RiotGamesRestAPIService {

	private final String[] apiKey = { "RGAPI-d41b0fc3-2198-4949-a3fc-72e2c0eba88d",
			"RGAPI-6A2DC49C-4A25-4A41-94A0-6593D7980BC4", "RGAPI-B059F48C-4BBD-42B8-A170-80245EF8C48F",
			"RGAPI-611601E0-6B4C-4806-AF45-1FF12B2BC1A5" };

	@Override
	public ArrayList<Game> getRecentRocordBySummonerID(long summonerID) {
		// TODO Auto-generated method stub

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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return content;
	}

	@Override
	public Summoner getSummonerBySummonerName(String summonerName) {
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		Summoner summoner = new Summoner();
		String summonerIDURL = "https://kr.api.pvp.net/api/lol/kr/v1.4/summoner/by-name/" + summonerName;

		try {

			URI uri = new URI(summonerIDURL);

			String summonerStr = getEntity(uri, 1).substring(5 + summonerName.length());
			summonerStr = "{" + summonerStr.substring(0, summonerStr.length() - 2) + "}";
			summoner = mapper.readValue(summonerStr, Summoner.class);

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
	public HashMap<String, String> getSummonerBySummonerID(long summonerID) {
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		String summonerNameURL = "https://kr.api.pvp.net/api/lol/kr/v1.4/summoner/" + summonerID + "/name";
		HashMap<String, String> summonerMap = new HashMap<>();
		try {

			URI uri = new URI(summonerNameURL);
			summonerMap = mapper.readValue(getEntity(uri, 2), HashMap.class);

		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return summonerMap;
	}

}
