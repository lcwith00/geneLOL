package com.genelol.dao.admin.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.genelol.vo.admin.board.AdminVideoBoardVO;

@Repository
public class AdminVideoBoardDAOImpl implements AdminVideoBoardDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.genelol.dao.adminboard.AdminVideoBoardMapper";

	@Override
	public List<AdminVideoBoardVO> adminVideoBoardList() {
		return session.selectList(namespace + ".adminVideoBoardList");
	}

	@Override
	public List<AdminVideoBoardVO> videoDetail(Integer board_no) {
		return session.selectList(namespace + ".videoDetail", board_no);
	}

}
