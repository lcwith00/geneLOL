package com.genelol.dao.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.genelol.vo.comment.CommentVO;
import com.genelol.vo.comment.pageVO;

@Repository
public class CommentDAOImpl implements CommentDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.genelol.mappers.CommentMapper";

	@Override
	// 리스트
	public List<CommentVO> list(Integer board_NO) throws Exception {
		// TODO Auto-generated method stub

		System.out.println("commentdao:"+board_NO);
		System.out.println("commentdao2:"+board_NO);
		return session.selectList(namespace + ".list", board_NO);
	}

	// 수정
	@Override
	public void create(CommentVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("commentdaovo:"+vo);
		session.insert(namespace + ".create", vo);
	}

	// 업데이트
	@Override
	public void update(CommentVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace + ".update", vo);
	}

	// 삭제
	@Override
	public void delete(Integer comment_NO) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace + ".delete", comment_NO);
	}

	// 페이지
	@Override
	public List<CommentVO> listPage(Integer board_NO, pageVO paging) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("board_NO", board_NO);
		paramMap.put("paging", paging);
		System.out.println("commentdao1:"+paging);
		return session.selectList(namespace + ".listPage", paramMap);
	}

	// 페이지
	@Override
	public int count(Integer board_NO) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".count", board_NO);
	}

	/*@Override
	public void mypagecomment(Integer userID, pageVO paging) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listPage");
	}*/

}
