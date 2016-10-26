package com.genelol.dao.comment;

import java.util.List;

import com.genelol.vo.comment.CommentVO;
import com.genelol.vo.comment.pageVO;

public interface CommentDAO {
	// 글번호
	public List<CommentVO> list(Integer board_NO) throws Exception;

	public void create(CommentVO vo) throws Exception;

	public void update(CommentVO vo) throws Exception;

	// 댓글번호
	public void delete(Integer comment_NO) throws Exception;

	// 페이지 처리
	public List<CommentVO> listPage(Integer board_NO, pageVO paging) throws Exception;

	// 페이지 처리
	public int count(Integer board_NO) throws Exception;
	/*
	public void mypagecomment(Integer userID,pageVO paging)throws Exception;
*/
}
