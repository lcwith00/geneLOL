package com.genelol.dao.ranking;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.genelol.vo.ranking.RankingCriteria;
import com.genelol.vo.ranking.RankingSearchCriteria;
import com.genelol.vo.ranking.RankingVO;

@Repository
public class RankingDAOImpl implements RankingDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "???.mapper.LankingMapper";

	@Override
	public RankingVO ranking_Read(Integer ranking) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RankingVO> ranking_List() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RankingVO> ranking_ListPage(int page) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RankingVO> ranking_ListCriteria(RankingCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int countPaging(RankingCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<RankingVO> ranking_ListSearch(RankingSearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int ranking_ListSearchCount(RankingSearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
