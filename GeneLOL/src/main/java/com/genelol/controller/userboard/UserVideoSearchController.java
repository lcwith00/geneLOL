package com.genelol.controller.userboard;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import com.genelol.service.userboard.UserVideoBoardService;

@Controller
@RequestMapping("svideo")
public class UserVideoSearchController {
	private static final Logger logger = LoggerFactory.getLogger(UserVideoSearchController.class);
	
	@Inject
	private UserVideoBoardService userVideoBoardService;
	
	
}
