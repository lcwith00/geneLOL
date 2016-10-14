package com.genelol.controller.main;

import java.util.ArrayList;
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

import net.rithms.riot.api.RiotApiException;
import net.rithms.riot.dto.Match.MatchDetail;

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
	public String recordSearch(@RequestParam("summonerName") String summonerName, Model model) {

		ArrayList<MatchDetail> matchList = new ArrayList<>();
		
		try {
			matchList = riotGamesRestAPIService.getRecentRocordBySummonerName(summonerName);
			model.addAttribute("matchList", matchList);
		} catch (RiotApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "/search/recordSearch";
	}
}