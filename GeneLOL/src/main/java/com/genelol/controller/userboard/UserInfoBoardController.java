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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.genelol.service.userboard.UserInfoBoardService;
import com.genelol.vo.userboard.UserInfoBoardVO;
import com.genelol.vo.userboard.UserVideoBoardVO;

import net.rithms.riot.api.Request;

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
		for (UserInfoBoardVO userInfoBoardVO : infoList) {
			logger.info(userInfoBoardVO.toString());
		}

		logger.info(uibvo.getBoard_title());
		logger.info(uibvo.getBoard_id());
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

	@RequestMapping(value = "/likeUpdate", method = RequestMethod.POST)
	public String likeUpdate(@ModelAttribute UserInfoBoardVO uibvo, Model model) throws Exception {
		logger.info("좋아요컨트롤러호출");
		logger.info(uibvo.toString());
		userInfoBoardService.likeCount(uibvo);

		return "/infoBoard/infodetail";
	}
}
