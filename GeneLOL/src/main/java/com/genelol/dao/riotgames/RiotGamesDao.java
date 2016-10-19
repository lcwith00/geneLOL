package com.genelol.dao.riotgames;

import net.rithms.riot.dto.Summoner.Summoner;

public interface RiotGamesDao {
	public Summoner getSummoner(long summonerID);
	
	public int insertSummoner(Summoner summoner); 
}
