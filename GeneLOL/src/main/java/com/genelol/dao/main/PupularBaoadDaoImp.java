package com.genelol.dao.main;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.genelol.vo.main.PopularBoardVo;

@Repository
public class PupularBaoadDaoImp implements PopularBoardDao {

	@Inject
	private SqlSession session;

	private static String namespace = "com.genelol.dao.main.MainMapper";

	@Override
	public List<PopularBoardVo> todayPopularBoardList() {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".todayPopularBoardList");
	}

	@Override
	public List<PopularBoardVo> remainPopularBoardList(int rows) {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".remainPopularBoardList", rows);
	}

}
