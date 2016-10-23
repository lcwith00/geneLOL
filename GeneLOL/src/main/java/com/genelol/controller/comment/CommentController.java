package com.genelol.controller.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.genelol.service.comment.CommentService;
import com.genelol.vo.comment.CommentVO;
import com.genelol.vo.comment.PageMakerVO;
import com.genelol.vo.comment.pageVO;

@RestController
@RequestMapping("/comment")
public class CommentController {
	@Inject
	private CommentService service;

	// 등록처리 post방식
	@RequestMapping(value = "", method = RequestMethod.POST)
	// rigister의 리턴타입: ResponseEntity<String>로 설계
	// 전송방식이 json 포멧이여서 처리해줄 @RequestBody애노테이션이 필요
	public ResponseEntity<String> register(@RequestBody CommentVO vo) {

		ResponseEntity<String> entity = null;
		try {
			service.addReply(vo);
			System.out.println("commentvo를 불러올까?"+vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			System.out.println("entity를 불러올까?"+entity);
		}
		return entity;
	}

	// 특정 게시물의 전체 댓글 목록의 처리 get방식
	@RequestMapping(value = "/all/{board_NO}", method = RequestMethod.GET)
	public ResponseEntity<List<CommentVO>> list(@PathVariable("board_NO") Integer board_NO) {

		ResponseEntity<List<CommentVO>> entity = null;
		try {
			entity = new ResponseEntity<>(service.listReply(board_NO), HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 수정처리
	// 전체 데이터를 수정하는put방식 일부의 데이터를 수정하는 patch방식
	@RequestMapping(value = "/{comment_NO}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> update(@PathVariable("comment_NO") Integer comment_NO, @RequestBody CommentVO vo) {

		ResponseEntity<String> entity = null;
		try {
			vo.setComment_NO(comment_NO);
			service.modifyReply(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 삭제
	@RequestMapping(value = "/{comment_NO}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("comment_NO") Integer comment_NO) {

		ResponseEntity<String> entity = null;
		try {
			service.removeReply(comment_NO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// get방식 처리 pagemakerVO,searchPageVO
	@RequestMapping(value = "/{board_NO}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("board_NO") Integer board_NO,
			@PathVariable("page") Integer page) {

		ResponseEntity<Map<String, Object>> entity = null;

		try {
			pageVO paging = new pageVO();
			paging.setPage(page);
			PageMakerVO pageMaker = new PageMakerVO();
			pageMaker.setPaging(paging);

			Map<String, Object> map = new HashMap<String, Object>();
			List<CommentVO> list = service.listReplyPage(board_NO, paging);

			map.put("list", list);
			int replyCount = service.count(board_NO);
			pageMaker.setTotalCount(replyCount);
			map.put("pageMakerVO", pageMaker);
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
