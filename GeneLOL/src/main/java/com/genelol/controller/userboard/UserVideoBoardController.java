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
import org.springframework.web.bind.annotation.ResponseBody;
import com.genelol.service.userboard.UserVideoBoardService;
import com.genelol.vo.userboard.UserVideoBoardVO;

@Controller
@RequestMapping(value = "/video")
public class UserVideoBoardController {
	private static final Logger logger = LoggerFactory.getLogger(UserVideoBoardController.class);

	@Inject
	private UserVideoBoardService userVideoBoardService;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGET(UserVideoBoardVO UVboard, Model model) throws Exception {
		logger.info("regist get........");
		return "/videoBoard/register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(UserVideoBoardVO UVboard, Model model) throws Exception {
		logger.info("regist post........");
		logger.info(UVboard.toString());

		userVideoBoardService.videoRegist(UVboard);

		model.addAttribute("result", "seccess");

		return "/videoBoard/success";
	}

	@RequestMapping(value = "/videoList", method = RequestMethod.GET)
	public String videoList(@ModelAttribute UserVideoBoardVO uvbvo, Model model) throws Exception {

		logger.info("videoList 호출 성공!");
		List<UserVideoBoardVO> videoList = userVideoBoardService.userVideoBoardList(uvbvo);
		model.addAttribute("videoList", videoList);

		return "/videoBoard/videolistpage";

	}

}
