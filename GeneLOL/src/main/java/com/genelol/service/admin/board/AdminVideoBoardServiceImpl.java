package com.genelol.service.admin.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.genelol.dao.admin.board.AdminVideoBoardDAO;
import com.genelol.vo.admin.board.AdminBoardVO;
import com.genelol.vo.admin.board.PageCount;
import com.genelol.vo.admin.board.SearchCount;

@Service
public class AdminVideoBoardServiceImpl implements AdminVideoBoardService {

	@Inject
	private AdminVideoBoardDAO dao;

	@Override
	public List<AdminBoardVO> adminVideoBoardList(Integer start_no) throws Exception {
		List<AdminBoardVO> adminVideoBoardList = null;
		adminVideoBoardList = dao.adminVideoBoardList(start_no);
		return adminVideoBoardList;
	}

	@Override
	public List<AdminBoardVO> searchList(String searchtype, String searchtext, Integer start_no) throws Exception {
		List<AdminBoardVO> searchList = null;
		searchList = dao.searchList(searchtype, searchtext, start_no);
		return searchList;
	}
	
	@Override
	public List<AdminBoardVO> videoDetail(Integer board_no) throws Exception {
		List<AdminBoardVO> videoDetail = null;
		videoDetail = dao.videoDetail(board_no);

		return videoDetail;
	}

	@Override
	public List<PageCount> videoCount() throws Exception {
		List<PageCount> videoCount = null;
		videoCount = dao.videoCount();

		return videoCount;
	}

	@Override
	public List<SearchCount> searchCount(String searchtype, String searchtext) throws Exception {
		List<SearchCount> searchCount = null;
		searchCount = dao.searchCount(searchtype, searchtext);
		
		return searchCount;
	}

}