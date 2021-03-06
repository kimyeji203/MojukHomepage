package com.inhatc.mojuk.board.vo;

public class Criteria { //Criteria:검색기준, 분류기준
	//굳이 안만들어두 댐. 파라미터 2개 이상 받도록 설계하면 되는데, 검색과 같은 기능이 붙게되면 점점 전달되는 파라미터양이 많아지므로 관리하기 불편
	
	private Integer page;
	private Integer perPageNum;
	private String manager_belong;

	public Criteria() {
		this.page = 1; //기본 값 1페이지
		this.perPageNum = 10; //리스트 당 데이터의 수는 10으로 강제 부여
	}

	public void setPage(int page) {

		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public void setPerPageNum(int perPageNum) {

		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}

		this.perPageNum = perPageNum;
	}
 // set메소드로 사용자가 고의로 잘못 입력할 수 있는 값에 대해 필요한 데이터를 조정가능
	
	public int getPage() {
		return page;
	}

	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}

	public int getPerPageNum() { //한 페이지당 보여지는 개수
		return this.perPageNum;
	}

	@Override
	public String toString() {
		return "Crtieria [page=" + page + "," + "perPageNum" + perPageNum + "]";
	}

	

	public String getManager_belong() {
		return manager_belong;
	}

	public void setManager_belong(String manager_belong) {
		this.manager_belong = manager_belong;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public void setPerPageNum(Integer perPageNum) {
		this.perPageNum = perPageNum;
	}

	
	
}
