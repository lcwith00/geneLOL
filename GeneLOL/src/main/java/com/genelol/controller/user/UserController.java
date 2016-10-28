package com.genelol.controller.user;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.genelol.common.BCrypt;
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
		String userpassword = userVO.getUserPassword();
		System.out.println(userpassword);
		String dbpw = BCrypt.hashpw(userpassword, BCrypt.gensalt(4));
		System.out.println(dbpw);
		userVO.setUserPassword(dbpw);
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
	@RequestMapping(value = "/loginpage", method = RequestMethod.GET)
	public String loginPage() throws Exception{
		return "/user/login";
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void login(UserVO userVO, Model model, HttpSession httpSession) throws Exception {

		UserVO vo = userService.login(userVO);
		if (vo == null) {
			return;
		}
		model.addAttribute("userVO", vo);
	}
	
	@RequestMapping(value = "/login/{key}", method = RequestMethod.POST)
	public void keyLogin(@PathVariable("key") String key, UserVO userVO, Model model, HttpSession httpSession) throws Exception {

		logger.info("/user/login/"+key);
		
		userService.cetification(key);

		userVO.setCertificate(true);
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

	@RequestMapping(value = "/resetpassword/{usermail}", method = RequestMethod.POST)
	public String resetPassword(@PathVariable("usermail") String usermail, RedirectAttributes rttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String username = userService.searchUserName(usermail);
		String userpassword = "";
		for (int i = 0; i < 8; i++) {
			char lowerStr = (char) (Math.random() * 26 + 97);
			if (i % 2 == 0) {
				userpassword += (int) (Math.random() * 10);
			} else {
				userpassword += lowerStr;
			}
		}

		userService.resetPassword(usermail, userpassword);

		FlashMap fm = RequestContextUtils.getOutputFlashMap(request);
		fm.put("username", username);
		fm.put("userpassword", userpassword);

		return "redirect:/email/send";
	}
}
