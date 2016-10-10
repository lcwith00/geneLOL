package com.genelol.controller.ranking;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.genelol.service.ranking.RankingService;
import com.genelol.vo.ranking.RankingCriteria;
import com.genelol.vo.ranking.RankingVO;

@Controller
@RequestMapping("/ranking/*")
public class RankingController {

	private static final Logger logger = LoggerFactory.getLogger(RankingController.class);

	@Inject
	private RankingService service;

	// @RequestMapping(value = "/register", method = RequestMethod.POST)
	// public String registPOST(BoardVO board, Model model) throws Exception {
	//
	// logger.info("regist post ...........");
	// logger.info(board.toString());
	//
	// service.regist(board);
	//
	// model.addAttribute("result", "success");
	//
	// //return "/board/success";
	// return "redirect:/board/listAll";
	// }

	@RequestMapping(value = "/ranking", method = RequestMethod.GET)
	public void rankingListAll(Model model) throws Exception {

		logger.info("show all list......................");
		model.addAttribute("rankingList", service.ranking_List());
	}

	@RequestMapping(value = "/rankingRead", method = RequestMethod.GET)
	public void read(@RequestParam("ranking") int ranking, Model model) throws Exception {

		model.addAttribute(service.ranking_Read(ranking));
	}


	@RequestMapping(value = "/rankingReadPage", method = RequestMethod.GET)
	public void read(@RequestParam("ranking") int ranking, @ModelAttribute("cri") RankingCriteria cri, Model model)
			throws Exception {

		model.addAttribute(service.ranking_Read(ranking));
	}

}
