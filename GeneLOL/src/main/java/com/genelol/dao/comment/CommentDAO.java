package com.genelol.dao.comment;

import java.util.List;

import com.genelol.vo.comment.CommentVO;

public interface CommentDAO {
	// 글번호
	public List<CommentVO> list(Integer board_NO) throws Exception;

	public void create(CommentVO vo) throws Exception;

	public void update(CommentVO vo) throws Exception;
	// 댓글번호
	public void delete(Integer comment_NO) throws Exception;

}
