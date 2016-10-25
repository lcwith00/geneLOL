package com.genelol.dao.userboard;

import java.util.List;


import com.genelol.vo.userboard.UserInfoBoardVO;

public interface UserInfoBoardDao {
	public List<UserInfoBoardVO> infoList(UserInfoBoardVO uibvo)throws Exception; //정보 목록 보기
	
	public void infoInsert(UserInfoBoardVO uibvo) throws Exception; //정보 올리기
	
	public void infoUpdate(UserInfoBoardVO uibvo) throws Exception;
	
	public void infoDelete(Integer board_no) throws Exception;
	
	public UserInfoBoardVO infoDetail(Integer board_no) throws Exception;
	
	public  void likeUpdate(UserInfoBoardVO uibvo ) throws Exception;// 추천수
	
	public void viewCount(UserInfoBoardVO uibvo) throws Exception; //조회수
 }
