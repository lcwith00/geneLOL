package com.genelol.test.main;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.genelol.dao.main.PopularBoardDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class PopularBoardDaoTest {

	@Inject
	private PopularBoardDao popularBoardDao;

	private Logger logger = Logger.getLogger(PopularBoardDaoTest.class);

	@Test
	public void todayPopularListTest() throws Exception {
		logger.info("todayPopularListTest");
		logger.info(popularBoardDao.todayPopularBoardList().get(0).toString());
		logger.info(popularBoardDao.todayPopularBoardList().size());
	}

	@Test
	public void remainPopularListTest() throws Exception {
		logger.info("remainPopularListTest");
		logger.info(popularBoardDao.remainPopularBoardList(6).get(0).toString());
		logger.info(popularBoardDao.remainPopularBoardList(6).size());
	}
}
