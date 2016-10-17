package com.genelol.dao.admin.member;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.genelol.common.PageCount;
import com.genelol.common.SearchCount;
import com.genelol.vo.user.UserVO;

@Repository
public class AdminSecessionManagementDAOImpl implements AdminSecessionManagementDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.genelol.dao.admin.member.AdminsecessionManagementMapper";

	@Override
	public List<UserVO> adminsecessionList(Integer start_no) {
		return session.selectList(namespace + ".adminsecessionList", start_no);
	}

	@Override
	public List<UserVO> searchList(String searchtype, String searchtext, Integer start_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchtype", searchtype);
		map.put("searchtext", searchtext);
		map.put("start_no", start_no);
		return session.selectList(namespace + ".searchList", map);
	}

	@Override
	public List<PageCount> secessionCount() {
		return session.selectList(namespace + ".secessionCount");
	}

	@Override
	public List<SearchCount> searchCount(String searchtype, String searchtext) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchtype", searchtype);
		map.put("searchtext", searchtext);
		return session.selectList(namespace + ".searchCount", map);
	}

	@Override
	public void deleteMember(Integer userid) {
		session.delete(namespace + ".deleteArticle", userid);
		session.delete(namespace + ".deleteMember", userid);
	}
}