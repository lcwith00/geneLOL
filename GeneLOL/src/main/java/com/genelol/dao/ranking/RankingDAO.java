package com.genelol.dao.ranking;

import java.util.List;

import com.genelol.vo.ranking.RankingCriteria;
import com.genelol.vo.ranking.RankingSearchCriteria;
import com.genelol.vo.ranking.RankingVO;

public interface RankingDAO {
	public RankingVO ranking_Read(Integer ranking) throws Exception;

	public List<RankingVO> ranking_List() throws Exception;

	public List<RankingVO> ranking_ListPage(int page) throws Exception;

	public List<RankingVO> ranking_ListCriteria(RankingCriteria cri) throws Exception;

	public int countPaging(RankingCriteria cri) throws Exception;

	// use for dynamic sql

	public List<RankingVO> ranking_ListSearch(RankingSearchCriteria cri) throws Exception;

	public int ranking_ListSearchCount(RankingSearchCriteria cri) throws Exception;
}
