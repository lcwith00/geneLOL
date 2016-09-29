package com.genelol.dao.user;

import com.genelol.vo.user.UserVO;

public interface UserDAO {

	void insertUser(UserVO userVO);
	
	public int checkUserName(String userName);
}
