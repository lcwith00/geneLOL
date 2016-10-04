package com.genelol.dao.user;

import com.genelol.vo.user.UserVO;

public interface UserDAO {

	public void insertUser(UserVO userVO);

	public int checkUserName(String userName);

	public UserVO getUserByUID(UserVO userVO);
}
