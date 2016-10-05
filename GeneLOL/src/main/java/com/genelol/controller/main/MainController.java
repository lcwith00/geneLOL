package com.genelol.controller.main;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.genelol.service.main.MainService;
import com.genelol.vo.main.PopularBoardVo;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	private MainService mainService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String recordSearch(Model model) {

		List<PopularBoardVo> popularBoardVoList = mainService.popularBoardList();

		model.addAttribute("popularBoardVoList", popularBoardVoList);

		return "home";
	}
}
