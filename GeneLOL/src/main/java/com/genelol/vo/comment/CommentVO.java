package com.genelol.vo.comment;

public class CommentVO {

	private Integer board_NO;		// 글 번호
	private Integer comment_NO;		// 댓글 번호
	private Integer comment_ListNO; // 댓글 순서
	private Integer comment_Depth; 	// 댓글 단계
	private Integer comment_Parent; // 원 댓글 번호
	private Integer userID; 		// 작성자
	private String comment_Content;	// 댓글 내용
	private Integer comment_Recomm;	// 좋아요 수
	private String comment_Date;	// 작성일자

	private String comment_File;	// 첨부파일
	private String c_File;			// 실제 서버에 저장한 파일명

	public Integer getBoard_NO() {
		return board_NO;
	}

	public void setBoard_NO(Integer board_NO) {
		this.board_NO = board_NO;
	}

	public Integer getComment_NO() {
		return comment_NO;
	}

	public void setComment_NO(Integer comment_NO) {
		this.comment_NO = comment_NO;
	}

	public Integer getComment_ListNO() {
		return comment_ListNO;
	}

	public void setComment_ListNO(Integer comment_ListNO) {
		this.comment_ListNO = comment_ListNO;
	}

	public Integer getComment_Depth() {
		return comment_Depth;
	}

	public void setComment_Depth(Integer comment_Depth) {
		this.comment_Depth = comment_Depth;
	}

	public Integer getComment_Parent() {
		return comment_Parent;
	}

	public void setComment_Parent(Integer comment_Parent) {
		this.comment_Parent = comment_Parent;
	}

	public Integer getUserID() {
		return userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	public String getComment_Content() {
		return comment_Content;
	}

	public void setComment_Content(String comment_Content) {
		this.comment_Content = comment_Content;
	}

	public Integer getComment_Recomm() {
		return comment_Recomm;
	}

	public void setComment_Recomm(Integer comment_Recomm) {
		this.comment_Recomm = comment_Recomm;
	}

	public String getComment_Date() {
		return comment_Date;
	}

	public void setComment_Date(String comment_Date) {
		this.comment_Date = comment_Date;
	}

	public String getComment_File() {
		return comment_File;
	}

	public void setComment_File(String comment_File) {
		this.comment_File = comment_File;
	}

	public String getC_File() {
		return c_File;
	}

	public void setC_File(String c_File) {
		this.c_File = c_File;
	}

}
