package com.genelol.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.genelol.dao.user.UserDAO;
import com.genelol.vo.user.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	@Transactional
	@Override
	public void registUser(UserVO userVO) throws Exception {
		userDAO.insertUser(userVO);
	}

	@Override
	public Integer checkUserName(String userName) throws Exception {
		return userDAO.checkUserName(userName);
	}

	@Override
	public UserVO login(UserVO userVO) throws Exception {
		return userDAO.getUserByUID(userVO);
	}
	
	@Override
	public Integer checkUserMail(String userMail) throws Exception {
		return userDAO.checkUserMail(userMail);
	}

	// 회원 목록
	@Override
	public List<UserVO> memberList() throws Exception {
		return userDAO.memberList();
	}

	@Override
	public void resetPassword(String usermail, String userpassword) throws Exception {
		userDAO.resetPassword(usermail, userpassword);
	}

	@Override
	public String searchUserName(String usermail) throws Exception {
		return userDAO.searchUserName(usermail);
	}

	@Override
	public String searchUserMail(String username) throws Exception {
		return userDAO.searchUserMail(username);
	}

	@Override
	public void cetification(String key) {
		userDAO.cetification(key);
	}
}