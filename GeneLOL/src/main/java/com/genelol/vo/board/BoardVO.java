package com.genelol.vo.board;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {

	private String board_ID; // 게시판 구분
	private Integer board_NO; // 글 번호
	private Integer userID; // 작성자
	private String board_Title; // 글 제목
	private String board_Content; // 글 내용
	private Integer board_Count; // 조회수
	private Integer board_Recomm; // 좋아요 수
	private String board_Date; // 작성일

	private MultipartFile board_File; // 첨부파일
	private String b_File;				// 실제 서버에 저장한 파일명

	public String getBoard_ID() {
		return board_ID;
	}

	public void setBoard_ID(String board_ID) {
		this.board_ID = board_ID;
	}

	public Integer getBoard_NO() {
		return board_NO;
	}

	public void setBoard_NO(Integer board_NO) {
		this.board_NO = board_NO;
	}

	public Integer getUserID() {
		return userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	public String getBoard_Title() {
		return board_Title;
	}

	public void setBoard_Title(String board_Title) {
		this.board_Title = board_Title;
	}

	public String getBoard_Content() {
		return board_Content;
	}

	public void setBoard_Content(String board_Content) {
		this.board_Content = board_Content;
	}

	public Integer getBoard_Count() {
		return board_Count;
	}

	public void setBoard_Count(Integer board_Count) {
		this.board_Count = board_Count;
	}

	public Integer getBoard_Recomm() {
		return board_Recomm;
	}

	public void setBoard_Recomm(Integer board_Recomm) {
		this.board_Recomm = board_Recomm;
	}

	public String getBoard_Date() {
		return board_Date;
	}

	public void setBoard_Date(String board_Date) {
		this.board_Date = board_Date;
	}

	public MultipartFile getBoard_File() {
		return board_File;
	}

	public void setBoard_File(MultipartFile board_File) {
		this.board_File = board_File;
	}

	public String getB_File() {
		return b_File;
	}

	public void setB_File(String b_File) {
		this.b_File = b_File;
	} // 실제 서버에 저장한 파일명

}
