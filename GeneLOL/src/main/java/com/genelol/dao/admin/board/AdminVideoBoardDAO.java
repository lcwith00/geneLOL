package com.genelol.dao.admin.board;

import java.util.List;

import com.genelol.vo.admin.board.AdminVideoBoardVO;

public interface AdminVideoBoardDAO {

	public List<AdminVideoBoardVO> adminVideoBoardList(); // 동영상 목록

	public List<AdminVideoBoardVO> videoDetail(Integer board_no); // 동영상 상세보기
}
