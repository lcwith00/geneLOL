package com.genelol.controller.mypage;


import java.util.List;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.genelol.controller.userboard.UserVideoBoardController;
import com.genelol.service.comment.CommentService;
import com.genelol.service.userboard.UserVideoBoardService;
import com.genelol.vo.comment.CommentVO;
import com.genelol.vo.comment.pageVO;
import com.genelol.vo.userboard.PageVO;
import com.genelol.vo.userboard.UserVideoBoardVO;

@Controller
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(UserVideoBoardController.class);

	@Inject
	private UserVideoBoardService userVideoBoardService;
	@Inject
	private CommentService commentService;

	// 마이페이지 비디오
	@RequestMapping(value = "/mypageList", method = RequestMethod.GET)
	public String mypage(@ModelAttribute UserVideoBoardVO uvbvo, Model model) throws Exception {

		logger.info("mypageList 호출 성공!");

		List<UserVideoBoardVO> mypageList = userVideoBoardService.videoList(uvbvo);
		for (UserVideoBoardVO uservideoBoardVO : mypageList) {
			logger.info(uservideoBoardVO.toString());
		}
		logger.info(uvbvo.getBoard_title());
		logger.info(uvbvo.getBoard_id());
		model.addAttribute("mypageList", mypageList);

		return "/mypage/mypageList";

	}
	
	@RequestMapping(value = "/mypageListpage", method = {RequestMethod.GET, RequestMethod.POST})
	public String page(Model model, @ModelAttribute UserVideoBoardVO uvbvo, Model model1) throws Exception {
	    logger.info(">>>> page home start!!");

	    //검색조건, 검색어
	    logger.info("SearchFiled : " + uvbvo.getSearchFiled());
	    logger.info("SearchValue : " + uvbvo.getSearchValue());
	  
	    //--페이징 처리
	    int totalCount = uvbvo.getTotalCount(); //게시물 총갯수를 구한다
	    uvbvo.setTotalCount(totalCount); //페이징 처리를 위한 setter 호출
	    model1.addAttribute("pageVO", uvbvo);
	    logger.info("PageSize // 한 페이지에 보여줄 게시글 수 : " + uvbvo.getPageSize());
	    logger.info("PageNo // 페이지 번호 : " + uvbvo.getPageNo());
	    logger.info("StartRowNo //조회 시작 row 번호 : " + uvbvo.getStartRowNo());
	    logger.info("EndRowNo //조회 마지막 now 번호 : " + uvbvo.getEndRowNo());
	    logger.info("FirstPageNo // 첫 번째 페이지 번호 : " + uvbvo.getFirstPageNo());
	    logger.info("FinalPageNo // 마지막 페이지 번호 : " + uvbvo.getFinalPageNo());
	    logger.info("PrevPageNo // 이전 페이지 번호 : " + uvbvo.getPrevPageNo());
	    logger.info("NextPageNo // 다음 페이지 번호 : " + uvbvo.getNextPageNo());
	    logger.info("StartPageNo // 시작 페이지 (페이징 네비 기준) : " + uvbvo.getStartPageNo());
	    logger.info("EndPageNo // 끝 페이지 (페이징 네비 기준) : " +uvbvo.getEndPageNo());
	    logger.info("totalCount // 게시 글 전체 수 : " + totalCount);
	    //--페이징 처리
	    List<UserVideoBoardVO> mypageList=  userVideoBoardService.videoList(uvbvo);
	    model1.addAttribute("resultList",  mypageList);
	  
	    return "/mypage/mypageList";
	}

	
	
	
	@RequestMapping(value = "/CommentList", method = RequestMethod.GET)
	public String mypagecomment(@ModelAttribute CommentVO covo, Model model,Integer board_NO) throws Exception {

		logger.info("mypageComment 호출 성공!");
		List<CommentVO> CommentList = commentService.listReply(board_NO);
		for (CommentVO CommentVO : CommentList) {
			logger.info(CommentVO.toString());
		}
		logger.info(null,covo.getComment_NO());
		model.addAttribute("CommentList", CommentList);

		return "/mypage/mypageList";
	}

}
