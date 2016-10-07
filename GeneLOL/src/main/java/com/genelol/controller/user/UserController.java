package com.genelol.controller.user;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.genelol.service.user.UserService;
import com.genelol.vo.user.UserVO;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Inject
	private UserService userService;

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String insertUser(UserVO userVO, RedirectAttributes rttr) throws Exception {
		logger.info("insert user..........");
		logger.info(userVO.toString());

		userService.registUser(userVO);
		return "redirect:/";
	}

	@RequestMapping("/idcheck")
	@ResponseBody
	public Map<String, String> checkID(String userName) throws Exception {

		Map<String, String> resultMap = new HashMap<String, String>();

		Integer resultCnt = userService.checkUserName(userName);
		String id = "";
		String result = "";
		String resultMsg = "";

		if (resultCnt == 0) {
			id = userName;
			result = "success";
			resultMsg = "사용가능한 아이디입니다.";
		} else {
			id = userName;
			result = "failure";
			resultMsg = "이미 사용중인 아이디입니다.";
		}

		resultMap.put("id", id);
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);

		return resultMap;
	}

	@RequestMapping("/mailcheck")
	@ResponseBody
	public Map<String, String> checkMail(String userMail) throws Exception {

		Map<String, String> resultMap = new HashMap<String, String>();

		Integer resultCnt = userService.checkUserMail(userMail);
		String mail = "";
		String result = "";
		String resultMsg = "";

		if (resultCnt == 0) {
			mail = userMail;
			result = "success";
			resultMsg = "사용가능한 이메일입니다.";
		} else {
			mail = userMail;
			result = "failure";
			resultMsg = "이미 사용중인 이메일입니다.";
		}

		resultMap.put("mail", mail);
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);

		return resultMap;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void login(UserVO userVO, Model model, HttpSession httpSession) throws Exception {

		logger.info("/user/login");

		UserVO vo = userService.login(userVO);
		if (vo == null) {
			return;
		}
		model.addAttribute("userVO", vo);
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model, HttpSession httpSession) throws Exception {
		logger.info("/user/logout");

		httpSession.invalidate();

		return "redirect:/";
	}
}
