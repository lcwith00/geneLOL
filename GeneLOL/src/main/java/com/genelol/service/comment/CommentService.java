package com.genelol.service.comment;

import java.util.List;

import com.genelol.vo.comment.CommentVO;
import com.genelol.vo.comment.pageVO;

public interface CommentService {

	public void addReply(CommentVO vo) throws Exception;

	public List<CommentVO> listReply(Integer board_NO) throws Exception;

	public void modifyReply(CommentVO vo) throws Exception;

	public void removeReply(Integer comment_NO) throws Exception;

	public List<CommentVO> listReplyPage(Integer board_NO, pageVO paging) throws Exception;

	public int count(Integer board_NO) throws Exception;
}
