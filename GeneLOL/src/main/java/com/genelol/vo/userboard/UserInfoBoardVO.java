package com.genelol.vo.userboard;

import java.sql.Clob;
import java.util.Date;

public class UserInfoBoardVO {
	private String board_id; // 게시판구분
	private Integer board_no; // 글 번호
	private String username; // 작성자
	private String board_title; // 글 제목
	private Clob board_content; // 글 내용
	private String board_file; // 첨부파일
	private Integer board_count; // 조회수
	private Integer board_recomm; // 좋아요 수
	private Date board_date; // 작성일자

	public String getBoard_id() {
		return board_id;
	}

	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public Clob getBoard_content() {
		return board_content;
	}

	public void setBoard_content(Clob board_content) {
		this.board_content = board_content;
	}

	public String getBoard_file() {
		return board_file;
	}

	public void setBoard_file(String board_file) {
		this.board_file = board_file;
	}

	public int getBoard_count() {
		return board_count;
	}

	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}

	public int getBoard_recomm() {
		return board_recomm;
	}

	public void setBoard_recomm(int board_recomm) {
		this.board_recomm = board_recomm;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

}
