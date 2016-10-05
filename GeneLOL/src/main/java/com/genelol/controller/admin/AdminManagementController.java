package com.genelol.controller.admin;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminManagementController {

	private static final Logger logger = LoggerFactory.getLogger(AdminManagementController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/memberListManagement", method = RequestMethod.GET)
	public String memberListManagement(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		return "admin/memberManagement/memberListManagement";
	}
	
	@RequestMapping(value = "/adminVideoBoard", method = RequestMethod.GET)
	public String adminVideoBoard(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		return "admin/memberManagement/adminVideoBoard";
	}

	@RequestMapping(value = "/adminInformationBoard", method = RequestMethod.GET)
	public String adminInformationBoard(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		return "admin/memberManagement/adminInformationBoard";
	}
	@RequestMapping(value = "/secessionListManagement", method = RequestMethod.GET)
	public String secssionListManagement(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		return "admin/memberManagement/secessionListManagement";
	}
}
