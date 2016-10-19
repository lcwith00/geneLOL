package com.genelol.service.admin.board;

import java.util.List;

import com.genelol.common.PageCount;
import com.genelol.common.SearchCount;
import com.genelol.vo.admin.board.AdminBoardVO;

public interface AdminTrashBoardService {

	public List<AdminBoardVO> adminTrashBoardList(Integer start_no) throws Exception; // 정보게시판
																						// 목록

	public List<AdminBoardVO> searchList(String searchtype, String searchtext, Integer start_no) throws Exception; // 검색
																													// 목록

	public List<AdminBoardVO> trashDetail(Integer board_no) throws Exception; // 상세보기

	public List<PageCount> trashCount() throws Exception; // 정보게시판 전체 게시물 수

	public List<SearchCount> searchCount(String searchtype, String searchtext) throws Exception;

	public void deleteArticle(Integer board_no) throws Exception;

}
