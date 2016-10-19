package com.genelol.dao.riotgames;

import net.rithms.riot.dto.Static.Champion;
import net.rithms.riot.dto.Summoner.Summoner;

public interface RiotGamesDao {
	public Summoner getSummoner(long summonerID);

	public Summoner getSummonerDetail(Summoner summoner);
	
	public int insertSummoner(Summoner summoner);

	public int updateSummoner(Summoner summoner);

	public Champion getChampion(long championID);

	public int insertChampion(Champion champion);
}
