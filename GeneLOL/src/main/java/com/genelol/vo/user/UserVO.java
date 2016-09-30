package com.genelol.vo.user;

public class UserVO {

	private Integer userID; // 유저식별코드
	private String userName; // 닉네임
	private String userMail; // 유저 이메일
	private boolean isCertificate; // 유저 인증
	private String userPassword; // 유저 비밀번호
	private String userType; // 유저 타입
	private String joinDate; // 가입일자

	public Integer getUserID() {
		return userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserMail() {
		return userMail;
	}

	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}

	public boolean isCertificate() {
		return isCertificate;
	}

	public void setCertificate(boolean isCertificate) {
		this.isCertificate = isCertificate;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	@Override
	public String toString() {
		return "UserVO [userID=" + userID + ", userName=" + userName + ", userMail=" + userMail + ", isCertificate="
				+ isCertificate + ", userPassword=" + userPassword + ", userType=" + userType + ", joinDate=" + joinDate
				+ "]";
	}

}