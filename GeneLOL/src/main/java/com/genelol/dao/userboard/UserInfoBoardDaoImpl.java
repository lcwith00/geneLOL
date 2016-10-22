package com.genelol.dao.userboard;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.genelol.vo.userboard.UserInfoBoardVO;

@Repository
public class UserInfoBoardDaoImpl implements UserInfoBoardDao{

	@Inject
	private SqlSession session;
	private static String namespace = "com.genelol.dao.uservboard.UserInfoBoardMapper"; // 메퍼 네임스페이스
	
	
	@Override
	public List<UserInfoBoardVO> infoList(UserInfoBoardVO uibvo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+ ".infoList", uibvo);
	}

	@Override
	public void infoInsert(UserInfoBoardVO uibvo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".infoInsert", uibvo);
	}

	@Override
	public void infoUpdatet(UserInfoBoardVO uibvo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void infoDelete(Integer board_no) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public UserInfoBoardVO infoDetail(Integer board_no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
}
