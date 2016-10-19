package com.genelol.dao.admin.member;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.genelol.common.PageCount;
import com.genelol.common.SearchCount;
import com.genelol.vo.user.UserVO;

@Repository
public class AdminOperatorManagementDAOImpl implements AdminOperatorManagementDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.genelol.dao.admin.member.AdminOperatorManagementMapper";
	
	@Override
	public List<UserVO> adminOperatorList(Integer start_no) {
		return session.selectList(namespace + ".adminOperatorList", start_no);
	}

	@Override
	public List<PageCount> operatorCount() {
		return session.selectList(namespace + ".operatorCount");
	}

	@Override
	public void secessionOperator(Integer userid) {
		session.update(namespace + ".secessionOperator", userid);
	}

}
