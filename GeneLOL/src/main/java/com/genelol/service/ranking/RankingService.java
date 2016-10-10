package com.genelol.service.ranking;

import java.util.List;

import com.genelol.vo.ranking.RankingVO;
import com.genelol.vo.ranking.RankingSearchCriteria;



public interface RankingService {

   public RankingVO ranking_Read(Integer ranking) throws Exception;

  public List<RankingVO> ranking_List() throws Exception;

  public List<RankingVO> ranking_ListSearchCriteria(RankingSearchCriteria cri) 
      throws Exception;

  public int ranking_ListSearchCount(RankingSearchCriteria cri) throws Exception;

}
