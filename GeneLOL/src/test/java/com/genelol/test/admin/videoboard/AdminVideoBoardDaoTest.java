package com.genelol.test.admin.videoboard;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.genelol.dao.admin.board.AdminVideoBoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class AdminVideoBoardDaoTest {

	@Inject
	private AdminVideoBoardDAO adminVideoBoardDao;

	private Logger logger = Logger.getLogger(AdminVideoBoardDaoTest.class);

	@Test
	public void adminVideoBoardList() throws Exception {
		logger.info("adminVideoBoardDaoTest");
		logger.info(adminVideoBoardDao.adminVideoBoardList(6).get(0).toString());
		logger.info(adminVideoBoardDao.adminVideoBoardList(6).size());
	}

}
