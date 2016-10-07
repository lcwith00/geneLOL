package com.genelol.controller.agreement;

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
public class AgreementController {
	private static final Logger logger = LoggerFactory.getLogger(AgreementController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/agreement", method = RequestMethod.GET)
	public String agreement(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		return "admin/memberManagement/agreement";
	}

	@RequestMapping(value = "/privacy", method = RequestMethod.GET)
	public String privacy(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		return "admin/memberManagement/privacy";
	}

}
