package com.genelol.vo.userboard;

import java.sql.Date;

public class UserVideoReplyVO {

	private Integer board_no; // 글번호
	private Integer comment_no; // 댓글번호
	private Integer comment_listno; // 댓글 순서
	private Integer comment_depth; // 댓글 단계
	private Integer commpent_parent; // 원 댓글 번호
	private Integer userid; // 유저 식별 코드
	private String comment_content; // 댓글 내용
	private String comment_file; // 첨부 파일
	private Integer comment_recomm; // 좋아요 수
	private Date comment_date; // 작성일자

	public Integer getBoard_no() {
		return board_no;
	}

	public void setBoard_no(Integer board_no) {
		this.board_no = board_no;
	}

	public Integer getComment_no() {
		return comment_no;
	}

	public void setComment_no(Integer comment_no) {
		this.comment_no = comment_no;
	}

	public Integer getComment_listno() {
		return comment_listno;
	}

	public void setComment_listno(Integer comment_listno) {
		this.comment_listno = comment_listno;
	}

	public Integer getComment_depth() {
		return comment_depth;
	}

	public void setComment_depth(Integer comment_depth) {
		this.comment_depth = comment_depth;
	}

	public Integer getCommpent_parent() {
		return commpent_parent;
	}

	public void setCommpent_parent(Integer commpent_parent) {
		this.commpent_parent = commpent_parent;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public String getComment_file() {
		return comment_file;
	}

	public void setComment_file(String comment_file) {
		this.comment_file = comment_file;
	}

	public Integer getComment_recomm() {
		return comment_recomm;
	}

	public void setComment_recomm(Integer comment_recomm) {
		this.comment_recomm = comment_recomm;
	}

	public Date getComment_date() {
		return comment_date;
	}

	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}

	@Override
	public String toString() {
		return "VideoReplyVO [board_no=" + board_no + ", comment_no=" + comment_no + ", comment_listno="
				+ comment_listno + ", comment_depth=" + comment_depth + ", commpent_parent=" + commpent_parent
				+ ", userid=" + userid + ", comment_content=" + comment_content + ", comment_file=" + comment_file
				+ ", comment_recomm=" + comment_recomm + ", comment_date=" + comment_date + "]";
	}

}
