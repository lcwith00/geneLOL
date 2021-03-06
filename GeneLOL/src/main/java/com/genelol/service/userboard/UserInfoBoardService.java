package com.genelol.service.userboard;

import java.util.List;

import com.genelol.vo.main.PopularBoardVo;
import com.genelol.vo.userboard.UserInfoBoardVO;

public interface UserInfoBoardService {

	public List<UserInfoBoardVO> infoList(UserInfoBoardVO uibvo) throws Exception; // 정보
																					// 목록
																					// 보기

	public void infoRegist(UserInfoBoardVO uibvo) throws Exception; // 게시글 올리기

	public void infoModify(UserInfoBoardVO uibvo) throws Exception; // 게시글 수정

	public void infoRemovo(Integer board_no) throws Exception; // 게시글 지우기

	public UserInfoBoardVO infoDetail(Integer board_no) throws Exception; // 게시글
																			// 상세보기

	public void likeCount(UserInfoBoardVO uibvo) throws Exception;// 좋아요수

	public void viewCount(UserInfoBoardVO uibvo) throws Exception;// 조회수

	public List<UserInfoBoardVO> infoScroll(Integer board_no) throws Exception;
	
	public List<UserInfoBoardVO> infoPopularBoardList(UserInfoBoardVO uibvo);
}
