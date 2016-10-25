
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
		String url = "";
		userVideoBoardService.videoRegist(UVboard);
		url = "/video/videoList";
		return "redirect:" + url;
	}

	@RequestMapping(value = "/videoList", method = RequestMethod.GET)
	public String videoList(@ModelAttribute UserVideoBoardVO uvbvo, Model model) throws Exception {

		List<UserVideoBoardVO> videoList = userVideoBoardService.videoList(uvbvo);
		model.addAttribute("videoList", videoList);
		return "/videoBoard/videolistpage";

	}

	@RequestMapping(value = "/videoDetail", method = RequestMethod.GET)
	public String videoDetail(@RequestParam("board_no") Integer board_no, Model model) throws Exception {

		UserVideoBoardVO uvbvo = userVideoBoardService.videoDetail(board_no);
		userVideoBoardService.viewCount(uvbvo);
		model.addAttribute("UserVideoBoardVO", userVideoBoardService.videoDetail(board_no));
		return "/videoBoard/videodetail";

	}

	@RequestMapping(value = "/videoLike", method = RequestMethod.POST)
	public String videoLike(@ModelAttribute UserVideoBoardVO uvbvo, Model model) throws Exception {
		userVideoBoardService.likeCount(uvbvo);
		return "redirect:/video/videoDetail?" + uvbvo.getBoard_no();

	}

	@RequestMapping(value = "/videoUpdateView", method = RequestMethod.GET)
	public String videoUpdateGET(Integer board_no, Model model) throws Exception {
		model.addAttribute(userVideoBoardService.videoDetail(board_no));
		model.addAttribute("UserVideoBoardVO", userVideoBoardService.videoDetail(board_no));
		return "/videoBoard/modify";
	}

	@RequestMapping(value = "/videoUpdate", method = RequestMethod.POST)
	public String videoUpdatePost(@ModelAttribute UserVideoBoardVO uvbvo, RedirectAttributes rttr) throws Exception {
		userVideoBoardService.videoModify(uvbvo);
		String url = "";
		rttr.addFlashAttribute("msg", "등록성공");
		url = "/video/videoList";
		return "redirect:" + url;
	}

	@RequestMapping(value = "/videoDelete", method = RequestMethod.POST)
	public String videoDelete(@RequestParam("board_no") Integer board_no, RedirectAttributes rttr) throws Exception {
		userVideoBoardService.videoRemove(board_no);
		String url = "";
		rttr.addFlashAttribute("msg", "삭제성공!");
		url = "/video/videoList";
		return "redirect:" + url;
	}

	@RequestMapping(value = "/infiniteScrollDown", method = RequestMethod.POST)
	public @ResponseBody List<UserVideoBoardVO> infiniteScrollDownPOST(@RequestBody UserVideoBoardVO uvbvo)
			throws Exception {
		Integer board_no = uvbvo.getBoard_no();
		return userVideoBoardService.videoScroll(board_no);

	}

}
