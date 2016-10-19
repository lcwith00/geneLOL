package com.genelol.dao.admin.member;

import java.util.List;

import com.genelol.common.PageCount;
import com.genelol.common.SearchCount;
import com.genelol.vo.user.UserVO;

public interface AdminOperatorManagementDAO {

	public List<UserVO> adminOperatorList(Integer start_no); // 회원 목록

	public List<PageCount> operatorCount(); // 전체 회원 수

	public void secessionOperator(Integer userid);
}
