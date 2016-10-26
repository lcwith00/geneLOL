package com.genelol.dao.admin.board;

import java.util.List;

import com.genelol.common.PageCount;
import com.genelol.common.SearchCount;
import com.genelol.vo.admin.board.AdminBoardVO;
import com.genelol.vo.board.BoardVO;

public interface AdminInformationDAO {

	public List<AdminBoardVO> adminInformationBoardList(Integer start_no); // 목록

	public List<AdminBoardVO> searchList(String searchtype, String searchtext, Integer start_no); // 검색
																									// 목록

	public List<AdminBoardVO> infoDetail(Integer board_no); // 상세보기

	public List<PageCount> infoCount();

	public List<SearchCount> searchCount(String searchtype, String searchtext);

	public void deleteArticle(Integer board_no);

	public Integer searchUserID(String username);

	public void insertArticle(BoardVO boardVO);
}