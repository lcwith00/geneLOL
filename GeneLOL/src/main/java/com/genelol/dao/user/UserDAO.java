package com.genelol.dao.user;

import java.util.List;

import com.genelol.vo.user.UserVO;

public interface UserDAO {

	public void insertUser(UserVO userVO);

	public UserVO getUserByUID(UserVO userVO);

	public Integer checkUserName(String userName);

	public Integer checkUserMail(String userMail);
	
	public List<UserVO> memberList()throws Exception; //회원 목록
}
