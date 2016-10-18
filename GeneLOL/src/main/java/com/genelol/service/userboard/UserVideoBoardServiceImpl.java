package com.genelol.service.userboard;

import java.util.List;



import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.genelol.dao.userboard.UserVideoBoardDao;
import com.genelol.vo.userboard.UserVideoBoardVO;

/*import oracle.net.aso.d;*/

@Service
public class UserVideoBoardServiceImpl implements UserVideoBoardService {

	@Inject
	private UserVideoBoardDao dao;

	@Override
	public List<UserVideoBoardVO> videoList(UserVideoBoardVO uvbvo) throws Exception {
		// TODO Auto-generated method stub
		List<UserVideoBoardVO> videoList = null;
		videoList = dao.videoList(uvbvo);
		return videoList;
	}

	@Override
	public void videoRegist(UserVideoBoardVO uvbvo) throws Exception {
		// TODO Auto-generated method stub
		dao.videoInsert(uvbvo);
	}

	// @Override
	// public UserVideoBoardVO read(Integer board_no) throws Exception {
	// // TODO Auto-generated method stub
	// return dao.videoRead(board_no);
	// }

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
	public UserVideoBoardVO videoDetail(Integer board_no) throws Exception {
		// TODO Auto-generated method stub

		UserVideoBoardVO videoDetail = null;
		videoDetail = dao.videoDetail(board_no);

		return videoDetail;
	}

	@Override
	public List<UserVideoBoardVO> videoScroll(Integer board_no) throws Exception {
		// TODO Auto-generated method stub
		List<UserVideoBoardVO> videoScroll = null;
		videoScroll = dao.infiniteScrollDown(board_no);
		return videoScroll;
	}

	@Override
	public void viewCount(UserVideoBoardVO uvbvo) throws Exception {
		// TODO Auto-generated method stub
		dao.countUpdate(uvbvo);
	}

	@Override
	public void likeCount(UserVideoBoardVO uvbvo) throws Exception {
		// TODO Auto-generated method stub
		dao.likeUpdate(uvbvo);
	}

	

}