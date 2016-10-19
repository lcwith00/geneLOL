package com.genelol.dao.riotgames;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import net.rithms.riot.dto.Summoner.Summoner;

@Repository
public class RiotGamesDaoImp implements RiotGamesDao {

	@Inject
	private SqlSession session;

	private static String namespace = "com.genelol.dao.main.RiotMapper";

	@Override
	public Summoner getSummoner(long summonerID) {
		return session.selectOne(namespace + ".summonerSelect",summonerID);
	}

	@Override
	public int insertSummoner(Summoner summoner) {
		return session.insert(namespace+".summonerInsert", summoner);
	}

}
