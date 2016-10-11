package com.genelol.dao.adminboard;

import java.util.List;

import com.genelol.vo.userboard.UserVideoBoardVO;

public interface AdminVideoBoardDAO {

	public List<UserVideoBoardVO> userVideoBoardList() throws Exception; // 동영상 목록보기

	public UserVideoBoardVO videoBoardDetail(UserVideoBoardVO uvbvo) throws Exception; // 동영상 상세보기

	public void videoDelete(Integer board_no) throws Exception; // 동영상 삭제
}
