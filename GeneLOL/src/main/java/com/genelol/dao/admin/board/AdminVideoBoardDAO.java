package com.genelol.dao.admin.board;

import java.util.List;

import com.genelol.common.PageCount;
import com.genelol.common.SearchCount;
import com.genelol.vo.admin.board.AdminBoardVO;

public interface AdminVideoBoardDAO {

	public List<AdminBoardVO> adminVideoBoardList(Integer start_no); // 동영상 목록
	
	public List<AdminBoardVO> searchList(String searchtype, String searchtext, Integer start_no); // 검색 동영상 목록

	public List<AdminBoardVO> videoDetail(Integer board_no); // 동영상 상세보기

	public List<PageCount> videoCount();

	public List<SearchCount> searchCount(String searchtype, String searchtext);

	public void deleteArticle(Integer board_no);
}
