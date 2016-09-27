
package com.genelol.dao.user;

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

}