package com.genelol.service.userboard;

import java.util.List;

import com.genelol.vo.userboard.UserInfoBoardVO;
import com.genelol.vo.userboard.UserVideoBoardVO;

public interface UserVideoBoardService {

	public List<UserVideoBoardVO> videoList(UserVideoBoardVO uvbvo) throws Exception; // 동영상
	// 목록보기

	public void videoRegist(UserVideoBoardVO uvbvo) throws Exception; // 동영상올리기

	// public UserVideoBoardVO read(Integer board_no) throws Exception; // 동영상
	// 읽기

	public void videoModify(UserVideoBoardVO uvbvo) throws Exception;// 수정하기

	public void videoRemove(Integer board_no) throws Exception; // 동영상 삭제

	public UserVideoBoardVO videoDetail(Integer board_no) throws Exception; // 동영상
	// 상세보기

	public List<UserVideoBoardVO> videoScroll(Integer board_no) throws Exception;

	public void viewCount(UserVideoBoardVO uvbvo) throws Exception;// 조회수

	public void likeCount(UserVideoBoardVO uvbvo) throws Exception;// 좋아요수
	
	public List<UserVideoBoardVO> videoPopularBoardList(UserVideoBoardVO uvbvo);
}
