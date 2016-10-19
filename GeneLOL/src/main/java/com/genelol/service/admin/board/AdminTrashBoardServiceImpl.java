package com.genelol.service.admin.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.genelol.common.PageCount;
import com.genelol.common.SearchCount;
import com.genelol.dao.admin.board.AdminTrashBoardDAO;
import com.genelol.vo.admin.board.AdminBoardVO;

@Service
public class AdminTrashBoardServiceImpl implements AdminTrashBoardService {

	@Inject
	private AdminTrashBoardDAO dao;

	@Override
	public List<AdminBoardVO> adminTrashBoardList(Integer start_no) throws Exception {
		List<AdminBoardVO> adminTrashBoardList = null;
		adminTrashBoardList = dao.adminTrashBoardList(start_no);
		return adminTrashBoardList;
	}

	@Override
	public List<AdminBoardVO> searchList(String searchtype, String searchtext, Integer start_no) throws Exception {
		List<AdminBoardVO> searchList = null;
		searchList = dao.searchList(searchtype, searchtext, start_no);
		return searchList;
	}

	@Override
	public List<AdminBoardVO> trashDetail(Integer board_no) throws Exception {
		List<AdminBoardVO> trashDetail = null;
		trashDetail = dao.trashDetail(board_no);
		return trashDetail;
	}

	@Override
	public List<PageCount> trashCount() throws Exception {
		List<PageCount> trashCount = null;
		trashCount = dao.trashCount();
		return trashCount;
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