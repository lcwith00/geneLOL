package com.genelol.test.userboard;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.genelol.dao.userboard.UserInfoBoardDao;
import com.genelol.vo.userboard.UserInfoBoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })

public class UserInfoBoardDAOtest {

	private static final Logger logger = LoggerFactory.getLogger(UserInfoBoardDAOtest.class);

	@Inject
	private UserInfoBoardDao dao;

	@Test

	public void testInsert() throws Exception {

		UserInfoBoardVO uibvo = new UserInfoBoardVO();
		uibvo.setBoard_title("새로운 글을 넣습니다.");
		uibvo.setBoard_content("동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라만세.");
		uibvo.setBoard_id("info");
		uibvo.setUsername("최승혁");
		dao.infoInsert(uibvo);
		logger.info(uibvo.toString());
	}

}
