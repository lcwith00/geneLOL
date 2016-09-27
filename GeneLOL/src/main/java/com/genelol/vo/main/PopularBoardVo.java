package com.genelol.vo.main;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class PopularBoardVo {

	private Integer board_no; // 글 번호
	private String board_id; // 게시판 구분
	private Integer userid; // 작성자
	private String board_title; // 글 제목
	private String board_content; // 글 내용 
	private MultipartFile board_file; // 첨부 파일
	private Integer board_count; // 조회 수
	private Integer board_recomm; // 좋아요 수
	private Date board_date; // 작성일자 

	public Integer getBoard_no() {
		return board_no;
	}

	public void setBoard_no(Integer board_no) {
		this.board_no = board_no;
	}

	public String getBoard_id() {
		return board_id;
	}

	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public Integer getBoard_count() {
		return board_count;
	}

	public void setBoard_count(Integer board_count) {
		this.board_count = board_count;
	}

	public Integer getBoard_recomm() {
		return board_recomm;
	}

	public void setBoard_recomm(Integer board_recomm) {
		this.board_recomm = board_recomm;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	public MultipartFile getBoard_file() {
		return board_file;
	}

	public void setBoard_file(MultipartFile board_file) {
		this.board_file = board_file;
	}

	@Override
	public String toString() {
		return "PopularBoardVo [board_no=" + board_no + ", board_id=" + board_id + ", userid=" + userid
				+ ", board_title=" + board_title + ", board_content=" + board_content + ", board_file=" + board_file
				+ ", board_count=" + board_count + ", board_recomm=" + board_recomm + ", board_date=" + board_date
				+ "]";
	}

}
