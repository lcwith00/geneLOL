package com.genelol.service.userboard;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.genelol.dao.userboard.UserVideoReplyDao;
import com.genelol.vo.userboard.UserVideoReplyVO;

@Service
@Transactional
public class UserVideoReplyServiceImpl implements UserVideoReplyService {

	Logger logger = Logger.getLogger(UserVideoReplyServiceImpl.class);

	@Inject
	private UserVideoReplyDao userVideoReplyDao;

	@Override
	public List<UserVideoReplyVO> replyList(Integer board_no) {
		// TODO Auto-generated method stub
		List<UserVideoReplyVO> replyList = null;
		replyList = userVideoReplyDao.replyList(board_no);

		return replyList;
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
