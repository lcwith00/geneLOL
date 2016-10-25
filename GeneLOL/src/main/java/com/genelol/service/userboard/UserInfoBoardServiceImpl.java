package com.genelol.service.userboard;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.genelol.dao.userboard.UserInfoBoardDao;
import com.genelol.vo.userboard.UserInfoBoardVO;
import com.genelol.vo.userboard.UserVideoBoardVO;

@Service
public class UserInfoBoardServiceImpl implements UserInfoBoardService {

	@Inject
	private UserInfoBoardDao dao;

	@Override
	public List<UserInfoBoardVO> infoList(UserInfoBoardVO uibvo) throws Exception {
		// TODO Auto-generated method stub
		List<UserInfoBoardVO> infoList = null;
		infoList = dao.infoList(uibvo);
		return infoList;
	}

	@Override
	public void infoRegist(UserInfoBoardVO uibvo) throws Exception {
		// TODO Auto-generated method stub
		dao.infoInsert(uibvo);
	}

	@Override
	public void infoModify(UserInfoBoardVO uibvo) throws Exception {
		// TODO Auto-generated method stub
		dao.infoUpdate(uibvo);
	}

	@Override
	public void infoRemovo(Integer board_no) throws Exception {
		// TODO Auto-generated method stub
		dao.infoDetail(board_no);
	}

	@Override
	public UserInfoBoardVO infoDetail(Integer board_no) throws Exception {

		UserInfoBoardVO infoDetail = null;
		infoDetail = dao.infoDetail(board_no);

		return infoDetail;

	}

	@Override
	public void likeCount(UserInfoBoardVO uibvo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(uibvo.getBoard_no());
		dao.likeUpdate(uibvo);
	}

	@Override
	public void viewCount(UserInfoBoardVO uibvo) throws Exception {
		// TODO Auto-generated method stub
		dao.viewCount(uibvo);
	}

}
