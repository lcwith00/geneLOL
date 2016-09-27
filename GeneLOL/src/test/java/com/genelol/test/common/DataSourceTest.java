package com.genelol.test.common;

import static org.springframework.test.web.client.response.MockRestResponseCreators.withServerError;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.h2.table.Column;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.genelol.vo.userboard.UserVideoBoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class DataSourceTest {

	@Inject
	private DataSource ds;

	@Test
	public void testConnection() {
		try (Connection con = ds.getConnection()) {
			System.out.println(con);
			PreparedStatement pstmt = null;
			String sql = "select * from test";
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				System.out.println("test : " + rs.getString(1));
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
	}

	

}
