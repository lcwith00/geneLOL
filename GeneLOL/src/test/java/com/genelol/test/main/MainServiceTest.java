package com.genelol.test.main;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.genelol.service.main.MainService;
import com.genelol.vo.main.PopularBoardVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class MainServiceTest {

	@Autowired
	private MainService mainService;

	private static Logger logger = Logger.getLogger(MainServiceTest.class);

	@Test
	public void testPopularBoardList() {
		for (PopularBoardVo pbvo : mainService.popularBoardList()) {
			logger.info(pbvo.toString());
		}
	}
}
