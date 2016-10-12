package com.genelol.dao.user;

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
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".login", userVO);
	}

	@Override
	public Integer checkUserMail(String userMail) {
		return session.selectOne(namespace + ".checkUserMail", userMail);
	}

	// 회원 목록
	@Override
	public List<UserVO> memberList() throws Exception {
		return session.selectList(namespace + ".memberList");
	}

}