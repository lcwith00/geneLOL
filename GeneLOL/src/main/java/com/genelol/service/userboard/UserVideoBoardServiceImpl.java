package com.genelol.service.userboard;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.genelol.dao.userboard.UserVideoBoardDao;
import com.genelol.vo.userboard.UserVideoBoardVO;

@Service
public class UserVideoBoardServiceImpl implements UserVideoBoardService {

	@Inject
	private UserVideoBoardDao dao;

	@Override
	public List<UserVideoBoardVO> userVideoBoardList() throws Exception {
		// TODO Auto-generated method stub
		List<UserVideoBoardVO> videoList = null;
		videoList = dao.userVideoBoardList();
		return videoList;
	}

	@Override
	public void videoRegist(UserVideoBoardVO uvbvo) throws Exception {
		// TODO Auto-generated method stub
		dao.videoInsert(uvbvo);
	}

	@Override
	public UserVideoBoardVO read(Integer board_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.videoRead(board_no);
	}

	@Override
	public void videoModify(UserVideoBoardVO uvbvo) throws Exception {
		// TODO Auto-generated method stub
		dao.videoUpdate(uvbvo);

	}

	@Override
	public void videoRemove(Integer board_no) throws Exception {
		// TODO Auto-generated method stub
		dao.videoDelete(board_no);

	}

	@Override
	public UserVideoBoardVO videoBoardDetail(UserVideoBoardVO uvbvo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}