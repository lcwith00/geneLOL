package com.genelol.service.riotgames;

import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;

import net.rithms.riot.dto.Champion.Champion;
import net.rithms.riot.dto.Game.Game;
import net.rithms.riot.dto.League.League;
import net.rithms.riot.dto.Stats.RankedStats;
import net.rithms.riot.dto.Summoner.Summoner;

public interface RiotGamesService {
	public ArrayList<Game> getRecentRocordBySummonerID(long summonerID);

	public HashMap<String, Summoner> getSummonerBySummonerID(long summonerID);

	public Summoner getSummonerBySummonerName(String summonerName);

	public String getEntity(URI uri, int apiIndex);

	public HashMap<String, Summoner> getAllSummoner(ArrayList<Game> games);

	public League getLeagueEntryBySummonerID(long summonerID);

	public RankedStats getRankedStatsBySummonerID(long summonerID, String season);

	public HashMap<String, Champion> getAllChampion(ArrayList<Game> games, String champData);
}
