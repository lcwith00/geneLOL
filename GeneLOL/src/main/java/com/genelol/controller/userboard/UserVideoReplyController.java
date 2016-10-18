package com.genelol.controller.userboard;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.genelol.service.userboard.UserVideoReplyService;
import com.genelol.vo.userboard.UserVideoReplyVO;

@RestController
@RequestMapping(value = "/replies")
public class UserVideoReplyController {
	Logger logger = Logger.getLogger(UserVideoReplyController.class);

	@Autowired
	private UserVideoReplyService userVideoReplyService;

	@RequestMapping(value = "all/{board_no}", method = RequestMethod.GET)
	public ResponseEntity<List<UserVideoReplyVO>> videoList(@PathVariable("board_no") Integer board_no) {
		ResponseEntity<List<UserVideoReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<>(userVideoReplyService.replyList(board_no), HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
