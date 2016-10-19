package com.genelol.service.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.genelol.dao.main.PopularBoardDao;
import com.genelol.vo.main.PopularBoardVo;

@Service
@Transactional
public class MainServiceImp implements MainService {

	@Autowired
	private PopularBoardDao popularBoardDao;

	@Override
	public List<PopularBoardVo> popularBoardList() {
		// TODO Auto-generated method stub
		List<PopularBoardVo> popularBoardVoList = null;
		List<PopularBoardVo> addPopularBoardVoList = null;
		int listNum = 0;

		popularBoardVoList = popularBoardDao.todayPopularBoardList();

		if (popularBoardVoList == null) {
			listNum = 7;
		} else {
			if (popularBoardVoList.size() >= 7) {
				popularBoardVoList = popularBoardVoList.subList(0, 7);
			} else {
				listNum = 7 - popularBoardVoList.size();
				addPopularBoardVoList = popularBoardDao.remainPopularBoardList(listNum);
				popularBoardVoList.addAll(addPopularBoardVoList);
			}
		}
		System.out.println(popularBoardVoList.size()+"service");
		return popularBoardVoList;
	}

}
