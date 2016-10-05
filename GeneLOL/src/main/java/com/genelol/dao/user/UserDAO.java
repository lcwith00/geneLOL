package com.genelol.dao.user;

import com.genelol.vo.user.UserVO;

public interface UserDAO {

	public void insertUser(UserVO userVO);

	public UserVO getUserByUID(UserVO userVO);

	public Integer checkUserName(String userName);

	public Integer checkUserMail(String userMail);
}
