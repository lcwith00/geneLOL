package com.genelol.vo.admin.board;

public class PageCount {

	private Integer totalCount;

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	@Override
	public String toString() {
		return "PageCount [totalCount=" + totalCount + "]";
	}

}
