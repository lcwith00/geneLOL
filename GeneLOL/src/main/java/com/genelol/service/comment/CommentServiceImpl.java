package com.genelol.service.comment;

import java.util.List;

import javax.inject.Inject;

import com.genelol.dao.comment.CommentDAO;
import com.genelol.vo.comment.CommentVO;
import com.genelol.vo.comment.pageVO;


public class CommentServiceImpl implements CommentService{

	@Inject
	private CommentDAO dao;
	//댓글생성
	@Override
	public void addReply(CommentVO vo) throws Exception {
		// TODO Auto-generated method stub
		  dao.create(vo);
	}
	//보기
	@Override
	public List<CommentVO> listReply(Integer board_NO) throws Exception {
		// TODO Auto-generated method stub
		 return dao.list(board_NO);
	}
	//수정
	@Override
	public void modifyReply(CommentVO vo) throws Exception {
		// TODO Auto-generated method stub
	    dao.update(vo);
	}
	//삭제
	@Override
	public void removeReply(Integer comment_NO) throws Exception {
		// TODO Auto-generated method stub
	    dao.delete(comment_NO);
	}
	//페이징처리
	@Override
	public List<CommentVO> listReplyPage(Integer board_NO, pageVO paging) throws Exception {
		// TODO Auto-generated method stub
		  return dao.listPage(board_NO, paging);
	}
	//페이징처리
	@Override
	public int count(Integer board_NO) throws Exception {
		// TODO Auto-generated method stub
		return dao.count(board_NO);
	}

	
}
