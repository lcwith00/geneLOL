package com.genelol.api.riotgames.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Service;

import net.rithms.riot.api.RiotApi;
import net.rithms.riot.api.RiotApiException;
import net.rithms.riot.constant.Region;
import net.rithms.riot.dto.Match.MatchDetail;
import net.rithms.riot.dto.MatchList.MatchList;
import net.rithms.riot.dto.MatchList.MatchReference;
import net.rithms.riot.dto.Summoner.Summoner;

@Service
public class RiotGamesRestAPIServiceImp implements RiotGamesRestAPIService {

	private RiotApi api = new RiotApi("RGAPI-dbebf1c9-6f26-44bb-a436-5891a212801f", Region.KR);

	@Override
	public ArrayList<MatchDetail> getRecentRocordBySummonerName(String summonerName) throws RiotApiException {
		// TODO Auto-generated method stub

		ArrayList<MatchDetail> matchDetailList = new ArrayList<>();
		Map<String, Summoner> summonerMap = api.getSummonersByName(summonerName);

		MatchList matchList = api.getMatchList(summonerMap.get(summonerName).getId(), null, null, null, -1, -1, 0, 10);

		for (MatchReference matchReference : matchList.getMatches()) {
			matchDetailList.add(api.getMatch(matchReference.getMatchId()));
		}
		System.out.println(matchDetailList.size());
		return matchDetailList;
	}

}
