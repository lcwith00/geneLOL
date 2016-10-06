package com.genelol.dao.userboard;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.genelol.vo.userboard.UserVideoBoardVO;

@Repository
public class UserVideoBoardDaoImpl implements UserVideoBoardDao {

	@Inject
	private SqlSession session;

	private static String namespace = "com.genelol.dao.userboard.UserVideoBoardMapper"; // 매퍼
																						// namespace

	@Override
	public List<UserVideoBoardVO> userVideoBoardList() { // 동영상 게시판 목록
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".userVideoBoardList");
	}

	@Override
	public void videoInsert(UserVideoBoardVO uvbvo) {
		// TODO Auto-generated method stub
		session.insert(namespace + ".videoInsert", uvbvo);
	}

	@Override
	public UserVideoBoardVO videoDetail(Integer board_no) {
		// TODO Auto-generated method stub
		return (UserVideoBoardVO) session.selectOne(namespace + ".videoDetail", board_no);
	}

	@Override
	public void videoDelete(Integer board_no) {
		// TODO Auto-generated method stub
		session.delete(namespace + ".videoDelete", board_no);
	}

	// 글 수정 구현
	@Override
	public void videoUpdate(UserVideoBoardVO uvbvo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace + ".videoUpdate", uvbvo);
	}

	@Override
	public UserVideoBoardVO videoRead(Integer board_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".videoRead", board_no);
	}

	// 동영상 목록 구현

}
