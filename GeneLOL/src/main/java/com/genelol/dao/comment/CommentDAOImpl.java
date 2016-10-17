package com.genelol.dao.comment;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.genelol.vo.comment.CommentVO;


@Repository
public class CommentDAOImpl  implements CommentDAO{


	  @Inject
	  private SqlSession session;

	  private static String namespace="com.genelol.mapper.CommentMapper";
	@Override
	//리스트
	public List<CommentVO> list(Integer board_NO) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".list",board_NO);
	}
	//수정
	@Override
	public void create(CommentVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".create", vo);
	}
	//업데이트
	@Override
	public void update(CommentVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace + ".update", vo);
	}
		//삭제
	@Override
	public void delete(Integer comment_NO) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace + ".delete",comment_NO);
	}
		
}
