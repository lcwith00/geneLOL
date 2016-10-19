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
import com.genelol.common.SearchCount;
import com.genelol.service.admin.member.AdminMemberManagementService;
import com.genelol.vo.user.UserVO;

@Controller
@RequestMapping(value = "/membermanagement")
public class AdminMemberManagementController {

	private static final Logger logger = LoggerFactory.getLogger(AdminMemberManagementController.class);

	@Inject
	private AdminMemberManagementService service;

	@RequestMapping(value = "/memberlist/{start_no}", method = RequestMethod.GET)
	public ResponseEntity<List<UserVO>> list(@PathVariable("start_no") Integer start_no) throws Exception {

		ResponseEntity<List<UserVO>> listAll = null;
		listAll = new ResponseEntity<>(service.adminMemberList(start_no), HttpStatus.OK);

		return listAll;
	}

	@RequestMapping(value = "/memberlist/{searchtype}/{searchtext}/{start_no}", method = RequestMethod.GET)
	public ResponseEntity<List<UserVO>> searchList(@PathVariable("searchtype") String searchtype,
			@PathVariable("searchtext") String searchtext, @PathVariable("start_no") Integer start_no)
			throws Exception {

		ResponseEntity<List<UserVO>> listSearch = null;
		listSearch = new ResponseEntity<>(service.searchList(searchtype, searchtext, start_no), HttpStatus.OK);

		return listSearch;
	}

	@RequestMapping(value = "/totalcount")
	public ResponseEntity<List<PageCount>> memberCount() throws Exception {

		ResponseEntity<List<PageCount>> memberEntity = null;
		memberEntity = new ResponseEntity<>(service.memberCount(), HttpStatus.OK);

		return memberEntity;
	}

	@RequestMapping(value = "/searchcount/{searchtype}/{searchtext}")
	public ResponseEntity<List<SearchCount>> searchCount(@PathVariable("searchtype") String searchtype,
			@PathVariable("searchtext") String searchtext) throws Exception {

		ResponseEntity<List<SearchCount>> searchEntity = null;
		searchEntity = new ResponseEntity<>(service.searchCount(searchtype, searchtext), HttpStatus.OK);

		return searchEntity;
	}
	
	@RequestMapping(value = "/secessionprocess", method = RequestMethod.POST)
	@ResponseBody
	public void secessionMember(@RequestParam(value = "userID[]") List<Integer> valueArr) throws Exception {
		for(Integer value : valueArr){
			service.secessionMember(value);
		}
	}
}
