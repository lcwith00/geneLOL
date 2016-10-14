package com.genelol.service.admin.board;

import java.util.List;

import com.genelol.vo.admin.board.AdminVideoBoardVO;
import com.genelol.vo.admin.board.PageCount;

public interface AdminVideoBoardService {

	public List<AdminVideoBoardVO> adminVideoBoardList(Integer start_no) throws Exception; // 동영상 목록
	
	public List<AdminVideoBoardVO> videoDetail(Integer board_no) throws Exception; // 동영상 상세보기
	
	public List<PageCount> videoCount() throws Exception;
}
