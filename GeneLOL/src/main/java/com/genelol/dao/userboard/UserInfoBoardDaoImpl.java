package com.genelol.dao.userboard;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.genelol.vo.userboard.UserInfoBoardVO;
import com.genelol.vo.userboard.UserVideoBoardVO;

@Repository
public class UserInfoBoardDaoImpl implements UserInfoBoardDao{

	@Inject
	private SqlSession session;
	private static String namespace = "com.genelol.dao.userboard.UserInfoBoardMapper"; // 메퍼 네임스페이스
	
	
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
	public void infoUpdate(UserInfoBoardVO uibvo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".infoUpdate", uibvo);
	}

	@Override
	public void infoDelete(Integer board_no) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".infoDelete",board_no); 
	}

	@Override
	public UserInfoBoardVO infoDetail(Integer board_no) throws Exception {
		// TODO Auto-generated method stub
		return (UserInfoBoardVO) session.selectOne(namespace + ".infoDetail", board_no);
	}

	@Override
	public void likeUpdate(UserInfoBoardVO uibvo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace +".likeUpdate", uibvo);
	}

	@Override
	public void viewCount(UserInfoBoardVO uibvo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace + ".viewCount", uibvo);
	}

	
}
