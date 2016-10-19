package com.genelol.service.admin.member;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.genelol.common.PageCount;
import com.genelol.dao.admin.member.AdminOperatorManagementDAO;
import com.genelol.vo.user.UserVO;

@Service
public class AdminOperatorManagementServiceImpl implements AdminOperatorManagementService {

	@Inject
	private AdminOperatorManagementDAO dao;
	
	@Override
	public List<UserVO> adminOperatorList(Integer start_no) throws Exception {
		List<UserVO> adminOperatorList = null;
		adminOperatorList = dao.adminOperatorList(start_no);
		return adminOperatorList;
	}

	@Override
	public List<PageCount> operatorCount() throws Exception {
		List<PageCount> operatorCount = null;
		operatorCount = dao.operatorCount();
		return operatorCount;
	}

	@Override
	public void secessionOperator(Integer userid) throws Exception {
		dao.secessionOperator(userid);
	}

}
