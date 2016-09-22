package com.genelol.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class DataSourceTest {

	@Inject
	private DataSource dataSource;

	@Test
	public void testConnection() throws Exception {
		System.out.println("ㅅㄷㄴ");
		try (Connection con = dataSource.getConnection()) {
			System.out.println(con);
			PreparedStatement pstmt = null;
			String sql = "select * from test";
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				System.out.println("asdasds");
				System.out.println(rs.getString(1));
			}
		} catch (Exception e) {
			System.out.println(e.getStackTrace());
		}
	}
}
