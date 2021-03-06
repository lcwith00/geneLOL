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
import com.genelol.service.admin.member.AdminSecessionManagementService;
import com.genelol.vo.user.UserVO;

@Controller
@RequestMapping(value = "/secessionmanagement")
public class AdminSecessionManagementController {

	private static final Logger logger = LoggerFactory.getLogger(AdminSecessionManagementController.class);

	@Inject
	private AdminSecessionManagementService service;

	@RequestMapping(value = "/secessionlist/{start_no}", method = RequestMethod.GET)
	public ResponseEntity<List<UserVO>> list(@PathVariable("start_no") Integer start_no) throws Exception {

		ResponseEntity<List<UserVO>> listAll = null;
		listAll = new ResponseEntity<>(service.adminsecessionList(start_no), HttpStatus.OK);

		return listAll;
	}

	@RequestMapping(value = "/secessionlist/{searchtype}/{searchtext}/{start_no}", method = RequestMethod.GET)
	public ResponseEntity<List<UserVO>> searchList(@PathVariable("searchtype") String searchtype,
			@PathVariable("searchtext") String searchtext, @PathVariable("start_no") Integer start_no)
			throws Exception {

		ResponseEntity<List<UserVO>> listSearch = null;
		listSearch = new ResponseEntity<>(service.searchList(searchtype, searchtext, start_no), HttpStatus.OK);

		return listSearch;
	}

	@RequestMapping(value = "/totalcount")
	public ResponseEntity<List<PageCount>> secessionCount() throws Exception {

		ResponseEntity<List<PageCount>> secessionEntity = null;
		secessionEntity = new ResponseEntity<>(service.secessionCount(), HttpStatus.OK);

		return secessionEntity;
	}

	@RequestMapping(value = "/searchcount/{searchtype}/{searchtext}")
	public ResponseEntity<List<SearchCount>> searchCount(@PathVariable("searchtype") String searchtype,
			@PathVariable("searchtext") String searchtext) throws Exception {

		ResponseEntity<List<SearchCount>> searchEntity = null;
		searchEntity = new ResponseEntity<>(service.searchCount(searchtype, searchtext), HttpStatus.OK);

		return searchEntity;
	}
	
	@RequestMapping(value = "/deleteMember")
	@ResponseBody
	public void testCheck(@RequestParam(value = "userID[]") List<Integer> valueArr) throws Exception {
		for(Integer value : valueArr){
			service.deleteMember(value);
		}
	}
}
