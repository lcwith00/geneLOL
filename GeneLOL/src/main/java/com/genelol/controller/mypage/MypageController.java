package com.genelol.controller.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.genelol.api.riotgames.service.RiotGamesRestAPIService;
import com.genelol.controller.userboard.UserVideoBoardController;
import com.genelol.service.comment.CommentService;
import com.genelol.service.main.MainService;
import com.genelol.service.userboard.UserVideoBoardService;
import com.genelol.vo.comment.CommentVO;
import com.genelol.vo.comment.PageMakerVO;
import com.genelol.vo.comment.pageVO;
import com.genelol.vo.main.PopularBoardVo;
import com.genelol.vo.userboard.UserVideoBoardVO;

@Controller
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(UserVideoBoardController.class);

	@Inject
	private UserVideoBoardService userVideoBoardService;

// 마이페이지 비디오
	@RequestMapping(value = "/mypageList", method = RequestMethod.GET)
	public String mypage(Model model) throws Exception {

		logger.info("mypageList 호출 성공!");

		List<UserVideoBoardVO> mypage = userVideoBoardService.videoList();
		for (UserVideoBoardVO uservideoBoardVO : mypage) {
			logger.info(uservideoBoardVO.toString());

		}

		model.addAttribute("mypageList", mypage);

		return "/mypage/mypageList";

	}
	
	/*@Autowired
	private MainService mainService;

	@RequestMapping(value = "/mypageList", method = RequestMethod.GET)
	public String recordSearchForm(Model model) {

		List<PopularBoardVo> popularBoardVoList = mainService.popularBoardList();

		model.addAttribute("mypageList", popularBoardVoList);

		return "/mypage/mypageList";
	}*/
	
	@Inject
	private CommentService service;
	
	// 특정 게시물의 전체 댓글 목록의 처리 get방식
		@RequestMapping(value = "/all/{board_content}", method = RequestMethod.GET)
		public ResponseEntity<List<CommentVO>> list(@PathVariable("board_content") Integer userID) {

			ResponseEntity<List<CommentVO>> entity = null;
			try {
				entity = new ResponseEntity<>(service.listReply(userID), HttpStatus.OK);

			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}

			return entity;
		}
	
	
	// get방식 처리 pagemakerVO,searchPageVO
	@RequestMapping(value = "/{userID}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("userID") Integer userID,
			@PathVariable("page") Integer page) {

		ResponseEntity<Map<String, Object>> entity = null;

		try {
			pageVO paging = new pageVO();
			paging.setPage(page);
			PageMakerVO pageMaker = new PageMakerVO();
			pageMaker.setPaging(paging);

			Map<String, Object> map = new HashMap<String, Object>();
			List<CommentVO> list = service.listReplyPage(userID, paging);

			map.put("list", list);
			int replyCount = service.count(userID);
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
