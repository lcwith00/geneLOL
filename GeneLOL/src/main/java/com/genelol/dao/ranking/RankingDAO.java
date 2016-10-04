package com.genelol.dao.ranking;

import java.util.List;

import com.genelol.vo.ranking.Criteria;
import com.genelol.vo.ranking.SearchCriteria;
import com.genelol.vo.ranking.RankingVO;

public interface RankingDAO {
	public RankingVO read(Integer ranking) throws Exception;

	public List<RankingVO> listAll() throws Exception;

	public List<RankingVO> listPage(int page) throws Exception;

	public List<RankingVO> listCriteria(Criteria cri) throws Exception;

	public int countPaging(Criteria cri) throws Exception;

	// use for dynamic sql

	public List<RankingVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;
}
