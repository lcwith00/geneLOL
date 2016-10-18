package com.genelol.dao.userboard;

import java.util.List;


import com.genelol.vo.userboard.UserVideoReplyVO;

public interface UserVideoReplyDao {
	
	public List<UserVideoReplyVO> replyList (Integer board_no);
	
	public Integer replyInsert(UserVideoReplyVO uvrvo);
	
	public Integer replyUpdate(UserVideoReplyVO uvrvo); 
	
	public Integer replyDelete(Integer comment_no);
}
