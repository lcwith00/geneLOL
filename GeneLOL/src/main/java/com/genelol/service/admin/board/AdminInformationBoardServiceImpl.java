package com.genelol.service.admin.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.genelol.common.PageCount;
import com.genelol.common.SearchCount;
import com.genelol.dao.admin.board.AdminInformationDAO;
import com.genelol.vo.admin.board.AdminBoardVO;

@Service
public class AdminInformationBoardServiceImpl implements AdminInformationBoardService {
	
	@Inject
	private AdminInformationDAO dao;

	@Override
	public List<AdminBoardVO> adminInformationBoardList(Integer start_no) throws Exception {
		List<AdminBoardVO> adminInformationBoardList = null;
		adminInformationBoardList = dao.adminInformationBoardList(start_no);
		return adminInformationBoardList;
	}

	@Override
	public List<AdminBoardVO> searchList(String searchtype, String searchtext, Integer start_no) throws Exception {
		List<AdminBoardVO> searchList = null;
		searchList = dao.searchList(searchtype, searchtext, start_no);
		return searchList;
	}

	@Override
	public List<AdminBoardVO> infoDetail(Integer board_no) throws Exception {
		List<AdminBoardVO> infoDetail = null;
		infoDetail = dao.infoDetail(board_no);
		return infoDetail;
	}

	@Override
	public List<PageCount> infoCount() throws Exception {
		List<PageCount> infoCount = null;
		infoCount = dao.infoCount();
		return infoCount;
	}

	@Override
	public List<SearchCount> searchCount(String searchtype, String searchtext) throws Exception {
		List<SearchCount> searchCount = null;
		searchCount = dao.searchCount(searchtype, searchtext);
		return searchCount;
	}
	
	@Override
	public void deleteArticle(Integer board_no) throws Exception {
		dao.deleteArticle(board_no);
	}
}
