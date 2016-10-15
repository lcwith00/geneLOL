package com.genelol.service.admin.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.genelol.dao.admin.board.AdminVideoBoardDAO;
import com.genelol.vo.admin.board.AdminVideoBoardVO;
import com.genelol.vo.admin.board.PageCount;
import com.genelol.vo.admin.board.SearchCount;

@Service
public class AdminVideoBoardServiceImpl implements AdminVideoBoardService {

	@Inject
	private AdminVideoBoardDAO dao;

	@Override
	public List<AdminVideoBoardVO> adminVideoBoardList(Integer start_no) throws Exception {
		List<AdminVideoBoardVO> adminVideoBoardVOList = null;
		adminVideoBoardVOList = dao.adminVideoBoardList(start_no);
		return adminVideoBoardVOList;
	}

	@Override
	public List<AdminVideoBoardVO> searchList(String searchtype, String searchtext, Integer start_no) throws Exception {
		List<AdminVideoBoardVO> searchList = null;
		searchList = dao.searchList(searchtype, searchtext, start_no);
		return searchList;
	}
	
	@Override
	public List<AdminVideoBoardVO> videoDetail(Integer board_no) throws Exception {
		List<AdminVideoBoardVO> videoDetail = null;
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