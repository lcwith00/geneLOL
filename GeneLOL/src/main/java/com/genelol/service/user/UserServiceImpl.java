package com.genelol.service.user;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.genelol.dao.user.UserDAO;
import com.genelol.vo.user.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO userDAO;

	@Transactional
	@Override
	public void registUser(UserVO userVO) throws Exception {
		userDAO.insertUser(userVO);
	}

	@Override
	public int checkUserName(String userName) throws Exception {
		return userDAO.checkUserName(userName);
	}

	@Override
	public UserVO login(UserVO userVO) throws Exception {
		return userDAO.getUserByUID(userVO);
	}

}