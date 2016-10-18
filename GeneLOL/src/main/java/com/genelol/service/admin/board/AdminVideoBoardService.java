package com.genelol.service.admin.board;

import java.util.List;

import com.genelol.common.PageCount;
import com.genelol.common.SearchCount;
import com.genelol.vo.admin.board.AdminBoardVO;

public interface AdminVideoBoardService {

	public List<AdminBoardVO> adminVideoBoardList(Integer start_no) throws Exception; // 동영상 목록
	
	public List<AdminBoardVO> searchList(String searchtype, String searchtext, Integer start_no) throws Exception; // 검색 동영상 목록
	
	public List<AdminBoardVO> videoDetail(Integer board_no) throws Exception; // 동영상 상세보기
	
	public List<PageCount> videoCount() throws Exception;	// 전체 게시물 수
	
	public List<SearchCount> searchCount(String searchtype, String searchtext) throws Exception;
}
