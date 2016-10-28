package com.genelol.controller.main;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.genelol.service.main.MainService;
import com.genelol.service.riotgames.RiotGamesService;
import com.genelol.service.riotgames.RiotGamesServiceImp.GameDescCompare;
import com.genelol.vo.main.PopularBoardVo;

import net.rithms.riot.dto.Game.Game;
import net.rithms.riot.dto.League.League;
import net.rithms.riot.dto.Static.Champion;
import net.rithms.riot.dto.Static.SummonerSpellList;
import net.rithms.riot.dto.Stats.RankedStats;
import net.rithms.riot.dto.Summoner.Summoner;

@Controller
public class MainController {

	@Autowired
	private MainService mainService;

	@Autowired
	private RiotGamesService riotGamesService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String recordSearchForm(Model model) {

		List<PopularBoardVo> popularBoardVoList = mainService.popularBoardList();
		model.addAttribute("popularBoardVoList", popularBoardVoList);

		return "home";
	}

	@RequestMapping(value = "/summoner", method = RequestMethod.GET)
	public String recordSearch(@RequestParam("summonerName") String summonerName, Model model)
			throws InterruptedException {

		ArrayList<Game> recentGames = new ArrayList<>();
		HashMap<Integer, Champion> champions = new HashMap<>();

		Summoner summoner = riotGamesService.getSummonerBySummonerName(summonerName);

		recentGames = riotGamesService.getRecentRocordBySummonerID(summoner.getId());

		Collections.sort(recentGames, new GameDescCompare());

		League league = riotGamesService.getLeagueEntryBySummonerID(summoner.getId());
		RankedStats rankedStats = riotGamesService.getRankedStatsBySummonerID(summoner.getId(), "SEASON2016");

		champions = riotGamesService.getRecentPlayedChampion(recentGames, "altimages");

		champions.putAll(riotGamesService.getRankedPlayedChampion(rankedStats, "altimages"));
		SummonerSpellList summonerSpellList = riotGamesService.getAllSpell("all");

		model.addAttribute("spellList", summonerSpellList);
		model.addAttribute("champions", champions);
		model.addAttribute("rankedStats", rankedStats);
		model.addAttribute("league", league);
		model.addAttribute("summoner", summoner);
		model.addAttribute("recentGames", recentGames);

		return "/search/recordSearch";
	}

}