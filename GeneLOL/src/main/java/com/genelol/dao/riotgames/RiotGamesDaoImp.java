package com.genelol.dao.riotgames;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import net.rithms.riot.dto.Static.Champion;
import net.rithms.riot.dto.Summoner.Summoner;

@Repository
public class RiotGamesDaoImp implements RiotGamesDao {

	@Inject
	private SqlSession session;

	private static String namespace = "com.genelol.dao.main.RiotMapper";

	@Override
	public Summoner getSummoner(long summonerID) {
		return session.selectOne(namespace + ".summonerSelect", summonerID);
	}

	@Override
	public int insertSummoner(Summoner summoner) {
		return session.insert(namespace + ".summonerInsert", summoner);
	}

	@Override
	public Champion getChampion(long championID) {
		return session.selectOne(namespace + ".championSelect", championID);
	}

	@Override
	public int insertChampion(Champion champion) {
		return session.insert(namespace + ".championInsert", champion);
	}

	@Override
	public int updateSummoner(Summoner summoner) {
		return session.insert(namespace + ".summonerUpdate", summoner);
	}

	@Override
	public Summoner getSummonerDetail(Summoner summoner) {
		return session.selectOne(namespace + ".summonerDetailSelect", summoner);
	}

}
