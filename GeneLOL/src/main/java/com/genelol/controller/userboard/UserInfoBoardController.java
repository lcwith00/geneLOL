package com.genelol.controller.userboard;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.genelol.service.userboard.UserInfoBoardService;
import com.genelol.vo.userboard.UserInfoBoardVO;
import com.genelol.vo.userboard.UserVideoBoardVO;

@Controller
@RequestMapping(value = "/info")
public class UserInfoBoardController {
	private static final Logger logger = LoggerFactory.getLogger(UserInfoBoardController.class);

	@Inject
	private UserInfoBoardService userInfoBoardService;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGET(UserInfoBoardVO UVboard, Model model) throws Exception {
		logger.info("regist get........");
		return "/infoBoard/inforegister";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(UserInfoBoardVO uibvo, Model model) throws Exception {
		logger.info("regist post........");
		logger.info(uibvo.toString());

		String url = "";
		//
		userInfoBoardService.infoRegist(uibvo);

		url = "/info/infoList";

		return "redirect:" + url;
	}

	@RequestMapping(value = "/infoList", method = RequestMethod.GET)
	public String infoList(@ModelAttribute UserInfoBoardVO uibvo, Model model) throws Exception {
		logger.info("info list호출 성공!!!");
		logger.info(uibvo.getBoard_title());

		List<UserInfoBoardVO> infoList = userInfoBoardService.infoList(uibvo);

		logger.info(uibvo.getBoard_title());
		model.addAttribute("infoList", infoList);

		return "/infoBoard/infolistpage";

	}
}
