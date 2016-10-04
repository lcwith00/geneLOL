package com.genelol.service.ranking;

import java.util.List;

import com.genelol.vo.ranking.Criteria;
import com.genelol.vo.ranking.RankingVO;
import com.genelol.vo.ranking.SearchCriteria;



public interface RankingService {

   public RankingVO read(Integer ranking) throws Exception;

  public List<RankingVO> listAll() throws Exception;

  public List<RankingVO> listCriteria(Criteria cri) throws Exception;

  public int listCountCriteria(Criteria cri) throws Exception;

  public List<RankingVO> listSearchCriteria(SearchCriteria cri) 
      throws Exception;

  public int listSearchCount(SearchCriteria cri) throws Exception;

}
