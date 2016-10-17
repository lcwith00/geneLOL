package com.genelol.dao.admin.board;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.genelol.vo.admin.board.AdminBoardVO;
import com.genelol.vo.admin.board.PageCount;
import com.genelol.vo.admin.board.SearchCount;

@Repository
public class AdminInformationDAOImpl implements AdminInformationDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.genelol.dao.adminboard.AdminInformationBoardMapper";

	@Override
	public List<AdminBoardVO> adminInformationBoardList(Integer start_no) {
		return session.selectList(namespace + ".adminInformationBoardList", start_no);
	}

	@Override
	public List<AdminBoardVO> searchList(String searchtype, String searchtext, Integer start_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchtype", searchtype);
		map.put("searchtext", searchtext);
		map.put("start_no", start_no);
		return session.selectList(namespace + ".searchList", map);
	}

	@Override
	public List<AdminBoardVO> infoDetail(Integer board_no) {
		return session.selectList(namespace + ".infoDetail", board_no);
	}

	@Override
	public List<PageCount> infoCount() {
		return session.selectList(namespace + ".infoCount");
	}

	@Override
	public List<SearchCount> searchCount(String searchtype, String searchtext) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchtype", searchtype);
		map.put("searchtext", searchtext);
		return session.selectList(namespace + ".searchCount", map);
	}

}
