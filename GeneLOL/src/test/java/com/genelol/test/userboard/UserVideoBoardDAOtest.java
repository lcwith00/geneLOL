package com.genelol.test.uservideo;



import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.genelol.dao.userboard.UserVideoBoardDao;
import com.genelol.vo.userboard.UserVideoBoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })

public class UserVideoBoardDAOtest {

	private static final Logger logger = LoggerFactory.getLogger(UserVideoBoardDAOtest.class);

	@Inject
	private UserVideoBoardDao dao;

	// @Test
	// public void testVideoInsert() throws Exception {
	//
	// UserVideoBoardVO videoBoard = new UserVideoBoardVO();
	// videoBoard.setBoard_id("2");
	// videoBoard.setUserid(1);
	// videoBoard.setBoard_title("되돌아온허디 매드무비");
	// videoBoard.setBoard_content("이즈장인이 펼치는 갈라쇼");
	// dao.videoInsert(videoBoard);
	// }

	// // 비디오 읽기 테스트
	// @Test
	// public void testRead() throws Exception {
	//
	// logger.info(dao.videoRead(1).toString());
	//
	// }

	// 비디오 수정 테스트
	@Test
	public void testUpdate() throws Exception {

		UserVideoBoardVO videoBoard = new UserVideoBoardVO();
		videoBoard.setBoard_title("수정된 글입니다.");
		videoBoard.setBoard_content("수정 테스트");
		videoBoard.setBoard_file("file2");
		videoBoard.setBoard_no(1);
		dao.videoUpdate(videoBoard);
	}

	// 비디오 삭제 테스트
	@Test
	
	public void testDelete() throws Exception {
		dao.videoDelete(1);
	}
	@Test
	public void testInfiniteDownScroll() throws Exception{
		
		dao.infiniteScrollDown(6);
		logger.info(dao.infiniteScrollDown(53).toString());;
		logger.info("123test");
	}
	
	@Test
	public void testViewCount() throws Exception{

		UserVideoBoardVO videoBoard = new UserVideoBoardVO();
		videoBoard.setBoard_no(0);
		logger.info(videoBoard.toString());
		dao.countUpdate(videoBoard);
		logger.info(videoBoard.getBoard_count().toString());
	}
}
