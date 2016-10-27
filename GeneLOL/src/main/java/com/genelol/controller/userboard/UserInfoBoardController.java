package com.genelol.controller.userboard;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.genelol.service.userboard.UserInfoBoardService;
import com.genelol.vo.admin.board.AdminBoardVO;
import com.genelol.vo.userboard.UserInfoBoardVO;

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
		logger.info("infoList 호출 성공!");
		List<UserInfoBoardVO> infoList = userInfoBoardService.infoList(uibvo);
		logger.info("infoList!"+infoList);
		
		model.addAttribute("infoList", infoList);
		return "/infoBoard/infolistpage";

	}

	@RequestMapping(value = "/infoUpdateView", method = RequestMethod.GET)
	public String infoUpdateGET(Integer board_no, Model model) throws Exception {
		model.addAttribute(userInfoBoardService.infoDetail(board_no));
		logger.info("modify get........");
		logger.info("" + board_no);
		model.addAttribute("UserInfoBoardVO", userInfoBoardService.infoDetail(board_no));
		return "/infoBoard/infoModify";
	}

	@RequestMapping(value = "/infoUpdate", method = RequestMethod.POST)
	public String infoUpdatePost(@ModelAttribute UserInfoBoardVO uibvo, RedirectAttributes rttr) throws Exception {

		logger.info("infoUpdate 호출 성공");

		userInfoBoardService.infoModify(uibvo);
		logger.info("" + uibvo);

		String url = "";

		rttr.addFlashAttribute("msg", "등록성공");

		url = "/info/infoList";

		return "redirect:" + url;
	}

	@RequestMapping(value = "/infoDetail", method = RequestMethod.GET)
	public String infoDetail(@RequestParam("board_no") Integer board_no, Model model) throws Exception {

		logger.info("infoDetail 호출성공!");
		logger.info("" + board_no);
		UserInfoBoardVO uibvo = userInfoBoardService.infoDetail(board_no);
		logger.info(uibvo.toString());

		logger.info("board_conut =" + uibvo.getBoard_count());

		model.addAttribute("UserInfoBoardVO", userInfoBoardService.infoDetail(board_no));

		return "/infoBoard/infodetail";

	}

	@RequestMapping(value = "/viewCount", method = RequestMethod.POST)
	public String viewCount(@ModelAttribute UserInfoBoardVO uibvo, Model model) throws Exception {
		logger.info("조회수컨트롤러호출");
		logger.info(uibvo.toString());
		userInfoBoardService.viewCount(uibvo);

		return "/infoBoard/infodetail";
	}

	@RequestMapping(value = "/likeUpdate", method = RequestMethod.POST)
	public String likeUpdate(@ModelAttribute UserInfoBoardVO uibvo, Model model) throws Exception {
		logger.info("좋아요컨트롤러호출");
		logger.info(uibvo.toString());
		userInfoBoardService.likeCount(uibvo);

		return "/infoBoard/infodetail";
	}

	@RequestMapping(value = "/infiniteScrollDown", method = RequestMethod.POST)
	public @ResponseBody List<UserInfoBoardVO> infiniteScrollDownPOST(@RequestBody UserInfoBoardVO uibvo)
			throws Exception {
		Integer board_no = uibvo.getBoard_no();
		return userInfoBoardService.infoScroll(board_no);
	}

	@RequestMapping(value = "/infoPopularBoardList", method = RequestMethod.GET)
	public ResponseEntity<List<UserInfoBoardVO>> infoPopularBoardList(@ModelAttribute UserInfoBoardVO uibvo, Model model)
			throws Exception {
		ResponseEntity<List<UserInfoBoardVO>> listAll = null;
		listAll = new ResponseEntity<>(userInfoBoardService.infoPopularBoardList(uibvo), HttpStatus.OK);
		model.addAttribute("poplist", listAll);
		return listAll;

	}
}
