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
import com.genelol.service.comment.CommentService;
import com.genelol.service.userboard.UserVideoBoardService;
import com.genelol.vo.comment.CommentVO;
import com.genelol.vo.comment.pageVO;
import com.genelol.vo.userboard.UserVideoBoardVO;

@Controller
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(UserVideoBoardController.class);

	@Inject
	private UserVideoBoardService userVideoBoardService;
	private CommentService commentService;

	// 마이페이지 비디오
	@RequestMapping(value = "/mypageList", method = RequestMethod.GET)
	public String mypage(@ModelAttribute UserVideoBoardVO uvbvo, Model model) throws Exception {

		logger.info("mypageList 호출 성공!");

		List<UserVideoBoardVO> mypageList = userVideoBoardService.videoList(uvbvo);
		for (UserVideoBoardVO uservideoBoardVO : mypageList) {
			logger.info(uservideoBoardVO.toString());
		}
		logger.info(uvbvo.getBoard_title());
		logger.info(uvbvo.getBoard_id());
		model.addAttribute("mypageList", mypageList);

		return "/mypage/mypageList";

	}
	
	@RequestMapping(value = "/mypageComment", method = RequestMethod.GET)
	public String mypagecomment(@ModelAttribute CommentVO covo, Model model,Integer board_NO) throws Exception {

		logger.info("mypageComment 호출 성공!");

		List<CommentVO> CommentList = commentService.listReply(board_NO);
		for (CommentVO CommentVO : CommentList) {
			logger.info(CommentVO.toString());
		}
		logger.info(null, covo.getComment_Content().length());
		model.addAttribute("CommentList", CommentList);

		return "/mypage/mypageList";
	}

	/*@RequestMapping(value = "/commentmypage", method = RequestMethod.GET)
	public void ajaxTest() {

	}*/

}
