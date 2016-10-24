package com.genelol.controller.user;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.genelol.email.Email;
import com.genelol.email.EmailSender;
import com.genelol.service.user.UserService;

@Controller
@RequestMapping("/email")
public class UserMailController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private EmailSender emailSender;

	@Inject
	private UserService userService;

	@RequestMapping(value = "/send")
	public String sendEmailAction(String username, String userpassword, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Email email = new Email();

		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		username = (String) flashMap.get("username");
		userpassword = (String) flashMap.get("userpassword");
		String usermail = userService.searchUserMail(username);

		String receiver = usermail; // 받을사람의 이메일
		String subject = username + "님의 비밀번호 초기화 요청 메일입니다.";
		String content = username + "님의 비밀번호가 초기화되었니다.\n\n" + "초기화된 비밀번호 : " + userpassword;

		email.setReceiver(receiver);
		email.setSubject(subject);
		email.setContent(content);
		emailSender.SendEmail(email);

		return "redirect:/";
	}
	
}
