package com.genelol.service.user;

import com.genelol.vo.user.UserVO;

public interface UserService {

	public void registUser(UserVO userVO) throws Exception;
	
	public Integer checkUserName(String userName) throws Exception;
	
	public Integer checkUserMail(String userMail) throws Exception;
}
