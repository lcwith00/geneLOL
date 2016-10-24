
package com.genelol.controller.userboard;



import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		//
		userVideoBoardService.videoRegist(UVboard);

		url = "/video/videoList";

		return "redirect:" + url;
	}

	@RequestMapping(value = "/videoList", method = RequestMethod.GET)
	public String videoList(@ModelAttribute UserVideoBoardVO uvbvo, Model model) throws Exception {

		logger.info("videoList 호출 성공!");

		List<UserVideoBoardVO> videoList = userVideoBoardService.videoList(uvbvo);
		for (UserVideoBoardVO uservideoBoardVO : videoList) {
			logger.info(uservideoBoardVO.toString());
		}

		logger.info(uvbvo.getBoard_title());
		logger.info(uvbvo.getBoard_id());
		model.addAttribute("videoList", videoList);

		return "/videoBoard/videolistpage";

	}

	@RequestMapping(value = "/videoDetail", method = RequestMethod.GET)
	public String videoDetail(@RequestParam("board_no") Integer board_no, Model model) throws Exception {

		logger.info("videoDetail 호출성공!");
		logger.info("" + board_no);
		UserVideoBoardVO uvbvo = userVideoBoardService.videoDetail(board_no);
		userVideoBoardService.viewCount(uvbvo);
		logger.info(uvbvo.toString());
		logger.info(uvbvo.getBoard_no().toString());

		logger.info("board_conut =" + uvbvo.getBoard_count());

		model.addAttribute("UserVideoBoardVO", userVideoBoardService.videoDetail(board_no));

		return "/videoBoard/videodetail";

	}

	@RequestMapping(value="/videoLike", method = RequestMethod.POST)
	public String videoLike(@ModelAttribute UserVideoBoardVO uvbvo , Model model) throws Exception{
		logger.info("좋아요 컨트롤러 호출");
		userVideoBoardService.likeCount(uvbvo);
		logger.info("board_recomm = "+ uvbvo.getBoard_recomm());
		logger.info("board_no = "+ uvbvo.getBoard_no());

		return "redirect:/video/videoDetail?"+uvbvo.getBoard_no();
		
	}

	@RequestMapping(value = "/videoUpdateView", method = RequestMethod.GET)
	public String videoUpdateGET(Integer board_no, Model model) throws Exception {
		model.addAttribute(userVideoBoardService.videoDetail(board_no));
		logger.info("modify get........");
		logger.info("" + board_no);
		model.addAttribute("UserVideoBoardVO", userVideoBoardService.videoDetail(board_no));
		return "/videoBoard/modify";
	}

	@RequestMapping(value = "/videoUpdate", method = RequestMethod.POST)
	public String videoUpdatePost(@ModelAttribute UserVideoBoardVO uvbvo, RedirectAttributes rttr) throws Exception {

		logger.info("videoUpdate 호출 성공");

		userVideoBoardService.videoModify(uvbvo);
		logger.info("" + uvbvo);

		String url = "";

		rttr.addFlashAttribute("msg", "등록성공");

		url = "/video/videoList";

		return "redirect:" + url;
	}

	@RequestMapping(value = "/videoDelete", method = RequestMethod.POST)
	public String videoDelete(@RequestParam("board_no") Integer board_no, RedirectAttributes rttr) throws Exception {

		logger.info("삭제호출");
		logger.info(board_no.toString());
		
		userVideoBoardService.videoRemove(board_no);

		String url = "";

		rttr.addFlashAttribute("msg", "삭제성공!");

		url = "/video/videoList";

		return "redirect:" + url;
	}

	@RequestMapping(value = "/infiniteScrollDown", method = RequestMethod.POST)
	public @ResponseBody List<UserVideoBoardVO> infiniteScrollDownPOST(@RequestBody UserVideoBoardVO uvbvo)
			throws Exception {
		logger.info("infiniteScrollDownPost is called.....");
		Integer board_no = uvbvo.getBoard_no();
		logger.info(board_no.toString());
		logger.info(userVideoBoardService.videoScroll(board_no).toString());
		return userVideoBoardService.videoScroll(board_no);

	}
	

	
}
