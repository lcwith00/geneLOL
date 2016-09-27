package com.genelol.controller.user;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.genelol.service.user.UserService;
import com.genelol.vo.user.UserVO;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Inject
	private UserService userService;
	
	@RequestMapping(value = "/", method = {RequestMethod.POST})
	public void insertUser(UserVO userVO, RedirectAttributes rttr) throws Exception {
		logger.info("insert user..........");
		logger.info(userVO.toString());

		userService.registUser(userVO);
	}
}
