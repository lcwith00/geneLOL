package com.genelol.dao.admin.board;

import java.util.List;

import com.genelol.common.PageCount;
import com.genelol.common.SearchCount;
import com.genelol.vo.admin.board.AdminBoardVO;

public interface AdminTrashBoardDAO {

	public List<AdminBoardVO> adminTrashBoardList(Integer start_no); // 정보게시판
	// 목록

	public List<AdminBoardVO> searchList(String searchtype, String searchtext, Integer start_no); // 검색
	// 목록

	public List<AdminBoardVO> trashDetail(Integer board_no); // 상세보기

	public List<PageCount> trashCount(); // 정보게시판 전체 게시물 수

	public List<SearchCount> searchCount(String searchtype, String searchtext);

	public void deleteArticle(Integer board_no);

}
