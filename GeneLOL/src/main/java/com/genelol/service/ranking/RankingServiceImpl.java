package com.genelol.service.ranking;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.genelol.dao.ranking.RankingDAO;
import com.genelol.vo.ranking.Criteria;
import com.genelol.vo.ranking.RankingVO;
import com.genelol.vo.ranking.SearchCriteria;

@Service
public class RankingServiceImpl implements RankingService {

	@Inject
	private RankingDAO dao;

	
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
	public List<RankingVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<RankingVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
