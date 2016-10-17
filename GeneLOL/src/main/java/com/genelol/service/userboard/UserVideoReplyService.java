package com.genelol.service.userboard;

import java.util.List;


import com.genelol.vo.userboard.UserVideoReplyVO;

public interface UserVideoReplyService {

	public List<UserVideoReplyVO> replyList (Integer board_no);
	
	public Integer replyInsert(UserVideoReplyVO uvrvo);
	
	public Integer replyUpdate(UserVideoReplyVO uvrvo); 
	
	public Integer replyDelete(Integer comment_no);
}


