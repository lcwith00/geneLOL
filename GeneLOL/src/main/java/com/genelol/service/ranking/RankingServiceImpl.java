package com.genelol.service.ranking;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.genelol.dao.ranking.RankingDAO;
import com.genelol.vo.ranking.RankingVO;
import com.genelol.vo.ranking.RankingSearchCriteria;

@Service
public class RankingServiceImpl implements RankingService {

	@Inject
	private RankingDAO dao;

	
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
	public List<RankingVO> ranking_ListSearchCriteria(RankingSearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int ranking_ListSearchCount(RankingSearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
