package com.genelol.controller.admin.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.genelol.common.PageCount;
import com.genelol.common.SearchCount;
import com.genelol.service.admin.board.AdminInformationBoardService;
import com.genelol.vo.admin.board.AdminBoardVO;
import com.genelol.vo.board.BoardVO;

@Controller
@RequestMapping(value = "/infoboard")
public class AdminInformationBoardController {

	private static final Logger logger = LoggerFactory.getLogger(AdminInformationBoardController.class);

	@Inject
	private AdminInformationBoardService service;

	@RequestMapping(value = "/article/{start_no}", method = RequestMethod.GET)
	public ResponseEntity<List<AdminBoardVO>> list(@PathVariable("start_no") Integer start_no) throws Exception {

		ResponseEntity<List<AdminBoardVO>> listAll = null;
		listAll = new ResponseEntity<>(service.adminInformationBoardList(start_no), HttpStatus.OK);

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
		readEntity = new ResponseEntity<>(service.infoDetail(board_no), HttpStatus.OK);

		return readEntity;
	}

	@RequestMapping(value = "/totalcount")
	public ResponseEntity<List<PageCount>> infoCount() throws Exception {

		ResponseEntity<List<PageCount>> infoEntity = null;
		infoEntity = new ResponseEntity<>(service.infoCount(), HttpStatus.OK);

		return infoEntity;
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
		for (Integer value : valueArr) {
			service.deleteArticle(value);
		}
	}

	// 글 등록
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public void boardInsert(@ModelAttribute BoardVO bvo, HttpServletRequest request) throws Exception {

		String username = request.getParameter("writer");

		Integer userID = service.searchUserID(username);
		String board_id = "info";
		String board_title = request.getParameter("subject");
		String board_content = request.getParameter("editor");

		bvo.setBoard_ID(board_id);
		bvo.setUserID(userID);
		bvo.setBoard_Title(board_title);
		bvo.setBoard_Content(board_content);

		logger.info(
				bvo.getBoard_ID() + "/" + bvo.getUserID() + "/" + bvo.getBoard_Title() + "/" + bvo.getBoard_Content());

		service.insertArticle(bvo);
	}
}
