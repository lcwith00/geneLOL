package com.genelol.service.admin.member;

import java.util.List;

import com.genelol.common.PageCount;
import com.genelol.common.SearchCount;
import com.genelol.vo.user.UserVO;

public interface AdminMemberManagementService {

	public List<UserVO> adminMemberList(Integer start_no) throws Exception; // 회원 목록

	public List<UserVO> searchList(String searchtype, String searchtext, Integer start_no) throws Exception; // 검색 목록

	public List<PageCount> memberCount() throws Exception; // 전체 회원 수

	public List<SearchCount> searchCount(String searchtype, String searchtext) throws Exception;
	
	public void secessionMember(Integer userid) throws Exception;
}