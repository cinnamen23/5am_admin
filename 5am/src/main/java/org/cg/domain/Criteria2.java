package org.cg.domain;

public class Criteria2 {
	private int skip2;
	private int page2;
	private int pageNum2;
	private String keyword2;
	private String type2;

	public Criteria2() {
		page2 = 1;
		pageNum2 = 10;
	}

	public int getPage2() {
		return page2;
	}

	public void setPage2(int page2) {
		if (page2 < 0) {
			this.page2 = 1;
		}

		this.page2 = page2;
	}

	public int getPageNum2() {
		if (this.pageNum2 < 0 || this.pageNum2 > 10) {
			this.pageNum2 = 10;
		}
		return (this.page2) * this.pageNum2 ;
	}

	public int getPageSize() {
		return 10;
	}

	public void setPageNum2(int pageNum2) {
		if (this.pageNum2 < 0 || this.pageNum2 > 10) {
			this.pageNum2 = 10;
		}
		this.pageNum2 = pageNum2;
	}

	public String getKeyword2() {
		return keyword2;
	}

	public void setKeyword(String keyword2) {
		this.keyword2 = keyword2;
	}

	public String getType2() {
		return type2;
	}

	public void setType2(String type2) {
		this.type2 = type2;
	}

	public int getSkip2() {

		return (this.page2 - 1) * this.pageNum2 +1;
	}

	public void setSkip2(int skip2) {
		this.skip2 = skip2;
	}

	@Override
	public String toString() {
		return "Criteria2 [skip2=" + skip2 + ", page2=" + page2 + ", pageNum2=" + pageNum2 + ", keyword2=" + keyword2
				+ ", type2=" + type2 + "]";
	}

	

}
