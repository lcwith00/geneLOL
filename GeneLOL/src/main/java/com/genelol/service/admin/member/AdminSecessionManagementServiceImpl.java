package com.genelol.service.admin.member;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.genelol.common.PageCount;
import com.genelol.common.SearchCount;
import com.genelol.dao.admin.member.AdminSecessionManagementDAO;
import com.genelol.vo.user.UserVO;

@Service
public class AdminSecessionManagementServiceImpl implements AdminSecessionManagementService {
	
	@Inject
	private AdminSecessionManagementDAO dao;

	@Override
	public List<UserVO> adminsecessionList(Integer start_no) throws Exception {
		List<UserVO> adminsecessionList = null;
		adminsecessionList = dao.adminsecessionList(start_no);
		return adminsecessionList;
	}

	@Override
	public List<UserVO> searchList(String searchtype, String searchtext, Integer start_no) throws Exception {
		List<UserVO> searchList = null;
		searchList = dao.searchList(searchtype, searchtext, start_no);
		return searchList;
	}

	@Override
	public List<PageCount> secessionCount() throws Exception {
		List<PageCount> secessionCount = null;
		secessionCount = dao.secessionCount();
		return secessionCount;
	}

	@Override
	public List<SearchCount> searchCount(String searchtype, String searchtext) throws Exception {
		List<SearchCount> searchCount = null;
		searchCount = dao.searchCount(searchtype, searchtext);
		return searchCount;
	}

	@Override
	public void deleteMember(Integer userid) throws Exception {
		dao.deleteMember(userid);
	}

}
