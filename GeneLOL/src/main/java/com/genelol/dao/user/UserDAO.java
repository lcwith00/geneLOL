package com.genelol.dao.user;

import java.util.List;

import com.genelol.vo.user.UserVO;

public interface UserDAO {

	public void insertUser(UserVO userVO);

	public UserVO getUserByUID(UserVO userVO);

	public Integer checkUserName(String userName);

	public Integer checkUserMail(String userMail);

	public List<UserVO> memberList(); // 회원 목록

	public void resetPassword(String usermail, String userpassword);

	public String searchUserName(String usermail);

	public String searchUserMail(String username);

	public void cetification(String key);

}
