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
import com.genelol.vo.ranking.RankingVO;
import com.genelol.vo.ranking.RankingSearchCriteria;

@Controller
@RequestMapping("/sranking/*")
public class RankingSearchBoardController {

	private static final Logger logger = LoggerFactory.getLogger(RankingSearchBoardController.class);

	@Inject
	private RankingService service;

	

	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("ranking") int ranking, @ModelAttribute("cri") RankingSearchCriteria cri, Model model)
			throws Exception {

		model.addAttribute(service.ranking_Read(ranking));
	}
	// @RequestMapping(value = "/list", method = RequestMethod.GET)
	// public void listPage(@ModelAttribute("cri") SearchCriteria cri,
	// Model model) throws Exception {
	//
	// logger.info(cri.toString());
	//
	// model.addAttribute("list", service.listCriteria(cri));
	//
	// PageMaker pageMaker = new PageMaker();
	// pageMaker.setCri(cri);
	//
	// pageMaker.setTotalCount(service.listCountCriteria(cri));
	//
	// model.addAttribute("pageMaker", pageMaker);
	// }
}
