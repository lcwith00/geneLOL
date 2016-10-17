package com.genelol.service.user;

import java.util.List;

import com.genelol.vo.user.UserVO;

public interface UserService {

	public void registUser(UserVO userVO) throws Exception;

	public UserVO login(UserVO userVO) throws Exception;

	public Integer checkUserName(String userName) throws Exception;

	public Integer checkUserMail(String userMail) throws Exception;
	
	public List<UserVO> memberList() throws Exception; //회원 목록

}
