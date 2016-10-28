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
	@RequestMapping(value = "/adminpage", method = RequestMethod.GET)
	public String adminPage(Locale locale, Model model) {
		return "admin/adminPage";
	}

	@RequestMapping(value = "/adminvideoboard", method = RequestMethod.GET)
	public String adminVideoBoard(Locale locale, Model model) {
		return "admin/boardManagement/adminVideoBoard";
	}

	@RequestMapping(value = "/admininformationboard", method = RequestMethod.GET)
	public String adminInformationBoard(Locale locale, Model model) {
		return "admin/boardManagement/adminInformationBoard";
	}
	
	@RequestMapping(value = "/admintrashboard", method = RequestMethod.GET)
	public String adminTrashBoard(Locale locale, Model model) {
		return "admin/boardManagement/adminTrashBoard";
	}

	@RequestMapping(value = "/memberlistmanagement", method = RequestMethod.GET)
	public String memberListManagement(Locale locale, Model model) throws Exception {
		return "admin/memberManagement/memberListManagement";
	}
	
	@RequestMapping(value = "/secessionlistmanagement", method = RequestMethod.GET)
	public String secssionListManagement(Locale locale, Model model) {
		return "admin/memberManagement/secessionListManagement";
	}
	
	@RequestMapping(value = "/operatorlistmanagement", method = RequestMethod.GET)
	public String adminListManagement(Locale locale, Model model) {
		return "admin/memberManagement/operatorListManagement";
	}
}
