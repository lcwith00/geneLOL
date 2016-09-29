package com.genelol.controller.user;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.genelol.service.user.UserService;
import com.genelol.vo.user.UserVO;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Inject
	private UserService userService;

	@RequestMapping(value = "/", method = RequestMethod.POST)
	public void insertUser(UserVO userVO, RedirectAttributes rttr) throws Exception {
		logger.info("insert user..........");
		logger.info(userVO.toString());

		userService.registUser(userVO);
	}

	/**   회원 아이디 중복 체크 */
	@RequestMapping("/idcheck.do")
	@ResponseBody
	public Map<String, String> checkUserName(String userName) throws Exception {

		Map<String, String> resultMap = new HashMap<String, String>();

		int resultCnt = userService.checkUserName(userName);
		String result = "";
		String resultMsg = "";
		if (resultCnt == 0) {
			result = "success";
			resultMsg = "사용가능한 아이디입니다.";
		} else {
			result = "failure";
			resultMsg = "이미 사용중인 아이디입니다.";
		}

		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);

		return resultMap;
	}
}
