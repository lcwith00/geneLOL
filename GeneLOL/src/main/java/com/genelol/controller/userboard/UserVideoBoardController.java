package com.genelol.controller.userboard;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.genelol.service.userboard.UserVideoBoardService;
import com.genelol.vo.userboard.UserVideoBoardVO;

@Controller
@RequestMapping(value = "/video")
public class UserVideoBoardController {
	private static final Logger logger = LoggerFactory.getLogger(UserVideoBoardController.class);

	@Inject
	private UserVideoBoardService service;

	@RequestMapping(value = "/videoRegister", method = { RequestMethod.GET, RequestMethod.POST })
	public String registerGET(UserVideoBoardVO UVboard, Model model) throws Exception {
		logger.info("regist get........");
		return "/videoBoard/videoWriteForm";
	}

}
