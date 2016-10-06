
package com.genelol.controller.userboard;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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

		String url = "";

		userVideoBoardService.videoRegist(UVboard);

		url = "/video/videoList";

		return "redirect:" + url;
	}

	@RequestMapping(value = "/videoList", method = RequestMethod.GET)
	public String videoList(Model model) throws Exception {

		logger.info("videoList 호출 성공!");

		List<UserVideoBoardVO> videoList = userVideoBoardService.userVideoBoardList();
		for (UserVideoBoardVO uservideoBoardVO : videoList) {
			logger.info(uservideoBoardVO.toString());

		}

		model.addAttribute("videoList", videoList);

		return "/videoBoard/videolistpage";

	}

	@RequestMapping(value = "/videoDetail", method = RequestMethod.GET)
	public String videoDetail(@RequestParam("board_no") Integer board_no, Model model) throws Exception {

		logger.info("videoDetail 호출성공!");

		logger.info("" + board_no);
		UserVideoBoardVO userVideoBoardVO = userVideoBoardService.videoDetail(board_no);
		logger.info(userVideoBoardVO.toString());
		model.addAttribute("UserVideoBoardVO", userVideoBoardService.videoDetail(board_no));

		
		return "/videoBoard/videodetail";

	}
}