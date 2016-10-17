package com.genelol.controller.mypage;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.genelol.api.riotgames.service.RiotGamesRestAPIService;
import com.genelol.controller.userboard.UserVideoBoardController;
import com.genelol.service.main.MainService;
import com.genelol.service.userboard.UserVideoBoardService;
import com.genelol.vo.main.PopularBoardVo;
import com.genelol.vo.userboard.UserVideoBoardVO;

@Controller
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(UserVideoBoardController.class);

	/*@Inject
	private UserVideoBoardService userVideoBoardService;

// 마이페이지 비디오
	@RequestMapping(value = "/mypageList", method = RequestMethod.GET)
	public String mypage(Model model) throws Exception {

		logger.info("mypageList 호출 성공!");


//		List<UserVideoBoardVO> mypage = userVideoBoardService.videoList();
//		for (UserVideoBoardVO uservideoBoardVO : mypage) {
//			logger.info(uservideoBoardVO.toString());
//
//		}
//
//		model.addAttribute("videoList", mypage);


		return "/mypage/mypageList";

	}*/
	
	@Autowired
	private MainService mainService;

	@RequestMapping(value = "/mypageList", method = RequestMethod.GET)
	public String recordSearchForm(Model model) {

		List<PopularBoardVo> popularBoardVoList = mainService.popularBoardList();

		model.addAttribute("mypageList", popularBoardVoList);

		return "/mypage/mypageList";
	}

}
