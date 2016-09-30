package com.genelol.service.user;

import com.genelol.vo.user.UserVO;

public interface UserService {

	public void registUser(UserVO userVO) throws Exception;
	
	public int checkUserName(String userName) throws Exception;
}
