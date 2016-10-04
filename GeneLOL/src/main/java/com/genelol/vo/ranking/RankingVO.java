package com.genelol.vo.ranking;

public class RankingVO {
	private int ranking;// 순위
	private String icon;// 아이콘
	private String id;// id명
	private String tier;// 티어
	private int tierScore;// 티어점수
	private String winningRate;// 승률

	public RankingVO() {
		super();
	}

	public RankingVO(int ranking, String icon, String id, String tier, int tierScore, String winningRate) {
		super();
		this.ranking = ranking;
		this.icon = icon;
		this.id = id;
		this.tier = tier;
		this.tierScore = tierScore;
		this.winningRate = winningRate;
	}

	public int getRanking() {
		return ranking;
	}

	public void setRanking(int ranking) {
		this.ranking = ranking;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTier() {
		return tier;
	}

	public void setTier(String tier) {
		this.tier = tier;
	}

	public int getTierScore() {
		return tierScore;
	}

	public void setTierScore(int tierScore) {
		this.tierScore = tierScore;
	}

	public String getWinningRate() {
		return winningRate;
	}

	public void setWinningRate(String winningRate) {
		this.winningRate = winningRate;
	}

	@Override
	public String toString() {
		return "RankingVO [getRanking()=" + getRanking() + ", getIcon()=" + getIcon() + ", getId()=" + getId()
				+ ", getTier()=" + getTier() + ", getTierScore()=" + getTierScore() + ", getWinningRate()="
				+ getWinningRate() + "]";
	}

}
