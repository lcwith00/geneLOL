package com.genelol.dao.ranking;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.genelol.vo.ranking.Criteria;
import com.genelol.vo.ranking.SearchCriteria;
import com.genelol.vo.ranking.RankingVO;


@Repository
public class RankingDAOImpl implements RankingDAO{

	  @Inject
	  private SqlSession session;

	private static String namespace = "???.mapper.BoardMapper";



	@Override
	public RankingVO read(Integer ranking) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<RankingVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RankingVO> listPage(int page) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RankingVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<RankingVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


	
}
