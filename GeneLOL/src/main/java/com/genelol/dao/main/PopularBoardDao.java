package com.genelol.dao.main;

import java.util.List;

import com.genelol.vo.main.PopularBoardVo;

public interface PopularBoardDao {

	public List<PopularBoardVo> todayPopularBoardList();

	public List<PopularBoardVo> remainPopularBoardList(int rows);
}
