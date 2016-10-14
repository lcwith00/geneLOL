package com.genelol.api.riotgames.service;



import java.util.ArrayList;

import net.rithms.riot.api.RiotApiException;
import net.rithms.riot.dto.Match.MatchDetail;

public interface RiotGamesRestAPIService {
	public ArrayList<MatchDetail> getRecentRocordBySummonerName(String summonerName) throws RiotApiException;
}
