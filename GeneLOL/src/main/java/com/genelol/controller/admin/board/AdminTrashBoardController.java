package com.genelol.controller.admin.board;

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
import com.genelol.service.admin.board.AdminInformationBoardService;
import com.genelol.service.admin.board.AdminTrashBoardService;
import com.genelol.vo.admin.board.AdminBoardVO;

@Controller
@RequestMapping(value = "/trashboard")
public class AdminTrashBoardController {

	private static final Logger logger = LoggerFactory.getLogger(AdminTrashBoardController.class);

	@Inject
	private AdminTrashBoardService service;

	@RequestMapping(value = "/article/{start_no}", method = RequestMethod.GET)
	public ResponseEntity<List<AdminBoardVO>> list(@PathVariable("start_no") Integer start_no) throws Exception {

		ResponseEntity<List<AdminBoardVO>> listAll = null;
		listAll = new ResponseEntity<>(service.adminTrashBoardList(start_no), HttpStatus.OK);

		return listAll;
	}

	@RequestMapping(value = "/article/{searchtype}/{searchtext}/{start_no}", method = RequestMethod.GET)
	public ResponseEntity<List<AdminBoardVO>> searchList(@PathVariable("searchtype") String searchtype,
			@PathVariable("searchtext") String searchtext, @PathVariable("start_no") Integer start_no)
			throws Exception {

		ResponseEntity<List<AdminBoardVO>> listSearch = null;
		listSearch = new ResponseEntity<>(service.searchList(searchtype, searchtext, start_no), HttpStatus.OK);

		return listSearch;
	}

	@RequestMapping(value = "/read/{board_no}")
	public ResponseEntity<List<AdminBoardVO>> read(@PathVariable("board_no") Integer board_no) throws Exception {

		ResponseEntity<List<AdminBoardVO>> readEntity = null;
		readEntity = new ResponseEntity<>(service.trashDetail(board_no), HttpStatus.OK);

		return readEntity;
	}

	@RequestMapping(value = "/totalcount")
	public ResponseEntity<List<PageCount>> trashCount() throws Exception {

		ResponseEntity<List<PageCount>> trashEntity = null;
		trashEntity = new ResponseEntity<>(service.trashCount(), HttpStatus.OK);

		return trashEntity;
	}

	@RequestMapping(value = "/searchcount/{searchtype}/{searchtext}")
	public ResponseEntity<List<SearchCount>> searchCount(@PathVariable("searchtype") String searchtype,
			@PathVariable("searchtext") String searchtext) throws Exception {

		ResponseEntity<List<SearchCount>> searchEntity = null;
		searchEntity = new ResponseEntity<>(service.searchCount(searchtype, searchtext), HttpStatus.OK);

		return searchEntity;
	}
	
	// 삭제처리
		@RequestMapping(value = "/deleteprocess", method = RequestMethod.POST)
		@ResponseBody
		public void deleteArticle(@RequestParam(value = "board_no[]") List<Integer> valueArr) throws Exception {
			for(Integer value : valueArr){
				service.deleteArticle(value);
			}
		}
}
