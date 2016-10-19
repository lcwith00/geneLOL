package com.genelol.service.admin.member;

import java.util.List;

import com.genelol.common.PageCount;
import com.genelol.common.SearchCount;
import com.genelol.vo.user.UserVO;

public interface AdminOperatorManagementService {

	public List<UserVO> adminOperatorList(Integer start_no) throws Exception; // 운영자 목록

	public List<PageCount> operatorCount() throws Exception; // 전체 회원 수

	public void secessionOperator(Integer userid) throws Exception;
}