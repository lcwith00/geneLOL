package com.genelol.dao.userboard;

import java.util.List;

import com.genelol.vo.userboard.UserInfoBoardVO;
import com.genelol.vo.userboard.UserVideoBoardVO;

public interface UserVideoBoardDao {
	public List<UserVideoBoardVO> videoList(UserVideoBoardVO uvbvo) throws Exception; // 동영상
	// 목록보기

	public void videoInsert(UserVideoBoardVO uvbvo) throws Exception; // 동영상올리기

	// public UserVideoBoardVO videoRead(Integer board_no) throws Exception; //
	// test
	// // 용
	// // 읽기

	public void videoUpdate(UserVideoBoardVO uvbvo) throws Exception;// 수정하기

	public void videoDelete(Integer board_no) throws Exception; // 동영상 삭제

	public UserVideoBoardVO videoDetail(Integer board_no) throws Exception; // 동영상
	// 상세보기

	public List<UserVideoBoardVO> infiniteScrollDown(Integer board_no) throws Exception;

	public  void countUpdate(UserVideoBoardVO uvbvo ) throws Exception;// 조회수
	
	public  void likeUpdate(UserVideoBoardVO uvbvo ) throws Exception;// 조회수
	
	public List<UserVideoBoardVO> videoPopularBoardList(UserVideoBoardVO uvbvo);
}
