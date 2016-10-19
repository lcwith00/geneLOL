package com.genelol.controller.admin.member;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.genelol.common.PageCount;
import com.genelol.service.admin.member.AdminOperatorManagementService;
import com.genelol.vo.user.UserVO;

@Controller
@RequestMapping(value = "/operatormanagement")
public class AdminOperatorManagementController {

	private static final Logger logger = LoggerFactory.getLogger(AdminOperatorManagementController.class);

	@Inject
	private AdminOperatorManagementService service;

	@RequestMapping(value = "/operatorlist/{start_no}", method = RequestMethod.GET)
	public ResponseEntity<List<UserVO>> list(@PathVariable("start_no") Integer start_no) throws Exception {

		ResponseEntity<List<UserVO>> listAll = null;
		listAll = new ResponseEntity<>(service.adminOperatorList(start_no), HttpStatus.OK);

		return listAll;
	}

	@RequestMapping(value = "/totalcount")
	public ResponseEntity<List<PageCount>> operatorCount() throws Exception {

		ResponseEntity<List<PageCount>> operatorEntity = null;
		operatorEntity = new ResponseEntity<>(service.operatorCount(), HttpStatus.OK);

		return operatorEntity;
	}

	@RequestMapping(value = "/secessionprocess", method = RequestMethod.POST)
	@ResponseBody
	public void testCheck(@RequestParam(value = "userID[]") List<Integer> valueArr) throws Exception {
		for (Integer value : valueArr) {
			service.secessionOperator(value);
		}
	}
}
