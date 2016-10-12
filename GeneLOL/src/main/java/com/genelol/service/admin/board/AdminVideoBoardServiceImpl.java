package com.genelol.service.admin.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.genelol.dao.admin.board.AdminVideoBoardDAO;
import com.genelol.vo.admin.board.AdminVideoBoardVO;

@Service
public class AdminVideoBoardServiceImpl implements AdminVideoBoardService {

	@Inject
	private AdminVideoBoardDAO dao;

	@Override
	public List<AdminVideoBoardVO> adminVideoBoardList() throws Exception {
		List<AdminVideoBoardVO> adminVideoBoardVOList = null;
		adminVideoBoardVOList = dao.adminVideoBoardList();
		return adminVideoBoardVOList;
	}

	@Override
	public List<AdminVideoBoardVO> videoDetail(Integer board_no) throws Exception {
		List<AdminVideoBoardVO> videoDetail = null;
		videoDetail = dao.videoDetail(board_no);

		return videoDetail;
	}
}