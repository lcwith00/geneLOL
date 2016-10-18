package com.genelol.dao.userboard;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.genelol.vo.userboard.UserVideoReplyVO;

@Repository
public class UserVideoReplyDaoImpl implements UserVideoReplyDao {

	@Autowired
	private SqlSession session;
	private static String namespace = "com.genelol.dao.userboard.UserVideoReplyMapper";

	@Override
	public List<UserVideoReplyVO> replyList(Integer board_no) {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".replyList", board_no);
	}

	@Override
	public Integer replyInsert(UserVideoReplyVO uvrvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer replyUpdate(UserVideoReplyVO uvrvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer replyDelete(Integer comment_no) {
		// TODO Auto-generated method stub
		return null;
	}

}
