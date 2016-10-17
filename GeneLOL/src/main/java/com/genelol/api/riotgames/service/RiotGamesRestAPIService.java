package com.genelol.api.riotgames.service;

import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;

import net.rithms.riot.dto.Game.Game;
import net.rithms.riot.dto.Summoner.Summoner;

public interface RiotGamesRestAPIService {
	public ArrayList<Game> getRecentRocordBySummonerID(long summonerID);

	public HashMap<String, String> getSummonerBySummonerID(long summonerID);

	public Summoner getSummonerBySummonerName(String summonerName);

	public String getEntity(URI uri,int apiIndex);
}
