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
import com.genelol.vo.ranking.Criteria;
import com.genelol.vo.ranking.PageMaker;
import com.genelol.vo.ranking.RankingVO;

@Controller
@RequestMapping("/board/*")
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
	public void listAll(Model model) throws Exception {

		logger.info("show all list......................");
		model.addAttribute("list", service.listAll());
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("ranking") int ranking, Model model) throws Exception {

		model.addAttribute(service.read(ranking));
	}


	@RequestMapping(value = "/listCri", method = RequestMethod.GET)
	public void listAll(Criteria cri, Model model) throws Exception {

		logger.info("show list Page with Criteria......................");

		model.addAttribute("list", service.listCriteria(cri));
	}

	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		logger.info(cri.toString());

		model.addAttribute("list", service.listCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		// pageMaker.setTotalCount(131);

		pageMaker.setTotalCount(service.listCountCriteria(cri));

		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("ranking") int ranking, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		model.addAttribute(service.read(ranking));
	}


}
