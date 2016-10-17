package com.genelol.service.admin.member;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.genelol.common.PageCount;
import com.genelol.common.SearchCount;
import com.genelol.dao.admin.member.AdminMemberManagementDAO;
import com.genelol.vo.user.UserVO;

@Service
public class AdminMemberManagementServiceImpl implements AdminMemberManagementService {

	@Inject
	private AdminMemberManagementDAO dao;

	@Override
	public List<UserVO> adminMemberList(Integer start_no) throws Exception {
		List<UserVO> adminMemberList = null;
		adminMemberList = dao.adminMemberList(start_no);
		return adminMemberList;
	}

	@Override
	public List<UserVO> searchList(String searchtype, String searchtext, Integer start_no) throws Exception {
		List<UserVO> searchList = null;
		searchList = dao.searchList(searchtype, searchtext, start_no);
		return searchList;
	}

	@Override
	public List<PageCount> memberCount() throws Exception {
		List<PageCount> memberCount = null;
		memberCount = dao.memberCount();
		return memberCount;
	}

	@Override
	public List<SearchCount> searchCount(String searchtype, String searchtext) throws Exception {
		List<SearchCount> searchCount = null;
		searchCount = dao.searchCount(searchtype, searchtext);
		return searchCount;
	}

	@Override
	public void secessionMember(Integer userid) throws Exception {
		dao.secessionMember(userid);
	}

}
