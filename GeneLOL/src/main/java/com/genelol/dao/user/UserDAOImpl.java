package com.genelol.dao.user;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.genelol.vo.user.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.genelol.mapper.UserMapper";

	@Override
	public void insertUser(UserVO userVO) {
		session.insert(namespace + ".insertUser", userVO);
	}

	@Override
	public Integer checkUserName(String userName) {
		return session.selectOne(namespace + ".checkUserName", userName);
	}

	@Override
	public UserVO getUserByUID(UserVO userVO) {
		return session.selectOne(namespace + ".login", userVO);
	}
	
	@Override
	public Integer checkUserMail(String userMail) {
		return session.selectOne(namespace + ".checkUserMail", userMail);
	}

	// 회원 목록
	@Override
	public List<UserVO> memberList() {
		return session.selectList(namespace + ".memberList");
	}

	@Override
	public void resetPassword(String usermail, String userpassword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("usermail", usermail);
		map.put("userpassword", userpassword);
		session.update(namespace + ".resetPassword", map);
	}

	@Override
	public String searchUserName(String usermail) {
		return session.selectOne(namespace + ".searchUserName", usermail);
	}

	@Override
	public String searchUserMail(String username) {
		return session.selectOne(namespace + ".searchUserMail", username);
	}

	@Override
	public void cetification(String key) {
		session.update(namespace + ".cetification", key);
	}

}