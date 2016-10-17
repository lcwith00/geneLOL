package com.genelol.controller.main;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.genelol.api.riotgames.service.RiotGamesRestAPIService;
import com.genelol.service.main.MainService;
import com.genelol.vo.main.PopularBoardVo;

import net.rithms.riot.dto.Game.Game;
import net.rithms.riot.dto.Game.Player;
import net.rithms.riot.dto.Summoner.Summoner;

@Controller
public class MainController {

	@Autowired
	private MainService mainService;

	@Autowired
	private RiotGamesRestAPIService riotGamesRestAPIService;

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
		HashMap<String, String> players = new HashMap<>();

		Summoner summoner = riotGamesRestAPIService.getSummonerBySummonerName(summonerName);

		recentGames = riotGamesRestAPIService.getRecentRocordBySummonerID(summoner.getId());

		Collections.sort(recentGames, new NoAscCompare());
		for (Game game : recentGames) {
			for (Player player : game.getFellowPlayers()) {
				if (players.containsKey(player.getSummonerId()+"")) {
					continue;
				} else {
					players.putAll(riotGamesRestAPIService.getSummonerBySummonerID(player.getSummonerId()));
				}
			}
		}

		model.addAttribute("players", players);
		model.addAttribute("recentGames", recentGames);

		return "/search/recordSearch";
	}

	static class NoAscCompare implements Comparator<Game> {

		/**
		 * 오름차순(ASC)
		 */
		@Override
		public int compare(Game o1, Game o2) {
			// TODO Auto-generated method stub
			return o1.getCreateDate() > o2.getCreateDate() ? -1 : o1.getCreateDate() > o2.getCreateDate() ? 1 : 0;
		}

	}
}