package com.genelol.controller.mypage;


import java.util.List;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.genelol.controller.userboard.UserVideoBoardController;

import com.genelol.service.userboard.UserVideoBoardService;

import com.genelol.vo.userboard.UserVideoBoardVO;

@Controller
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(UserVideoBoardController.class);

	@Inject
	private UserVideoBoardService userVideoBoardService;

	// 마이페이지 비디오
	@RequestMapping(value = "/mypageList", method = RequestMethod.GET)
	public String mypage(@ModelAttribute UserVideoBoardVO uvbvo, Model model) throws Exception {

		logger.info("mypageList 호출 성공!");

		List<UserVideoBoardVO> mypage = userVideoBoardService.videoList(uvbvo);
		for (UserVideoBoardVO uservideoBoardVO : mypage) {
			logger.info(uservideoBoardVO.toString());
		}
		model.addAttribute("mypageList", mypage);

		return "/mypage/mypageList";

	}

/*	@RequestMapping(value = "/commentmypage", method = RequestMethod.GET)
	public void ajaxTest() {

	}*/

}
