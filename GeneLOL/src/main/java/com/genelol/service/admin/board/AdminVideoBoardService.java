package com.genelol.service.admin.board;

import java.util.List;

import com.genelol.vo.admin.board.AdminVideoBoardVO;
import com.genelol.vo.admin.board.PageCount;
import com.genelol.vo.admin.board.SearchCount;

public interface AdminVideoBoardService {

	public List<AdminVideoBoardVO> adminVideoBoardList(Integer start_no) throws Exception; // 동영상 목록
	
	public List<AdminVideoBoardVO> searchList(String searchtype, String searchtext, Integer start_no) throws Exception; // 검색 동영상 목록
	
	public List<AdminVideoBoardVO> videoDetail(Integer board_no) throws Exception; // 동영상 상세보기
	
	public List<PageCount> videoCount() throws Exception;	// 전체 게시물 수
	
	public List<SearchCount> searchCount(String searchtype, String searchtext) throws Exception;
}
