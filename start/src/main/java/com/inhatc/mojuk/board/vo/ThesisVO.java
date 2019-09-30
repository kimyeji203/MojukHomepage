package com.inhatc.mojuk.board.vo;

import java.util.List;

public class ThesisVO {
	private Integer th_bno; //글 번호
	private String th_name; //논문 명
	private String th_institution; //논문 학회
	private String th_insti_name; //논문 학회 명
	private String th_group; //논문 작성 그룹
	private List<String> th_writerNames;
	private List<ThWriterVO> th_writers; //논문 작성자들의 정보
	private String th_page; //논문 페이지
	private String th_prof; //논문 담당 교수
	private String th_public_date; //논문 출판날짜
	private String th_regdate; //게시글 작성날짜
	
	private String th_writer;
	
	public String getTh_writer() {
		return th_writer;
	}
	public void setTh_writer(String th_writer) {
		this.th_writer =  th_writer;
	}
	
	public List<String> getTh_writerNames() {
		return th_writerNames;
	}
	public void setTh_writerNames(List<String> th_writerNames) {
		this.th_writerNames = th_writerNames;
	}
	public List<ThWriterVO> getTh_writers() {
		return th_writers;
	}
	public void setTh_writers(List<ThWriterVO> th_writers) {
		this.th_writers = th_writers;
	}
	public Integer getTh_bno() {
		return th_bno;
	}
	public void setTh_bno(Integer th_bno) {
		this.th_bno = th_bno;
	}
	public String getTh_name() {
		return th_name;
	}
	public void setTh_name(String th_name) {
		this.th_name = th_name;
	}
	public String getTh_institution() {
		return th_institution;
	}
	public void setTh_institution(String th_institution) {
		this.th_institution = th_institution;
	}
	public String getTh_insti_name() {
		return th_insti_name;
	}
	public void setTh_insti_name(String th_insti_name) {
		this.th_insti_name = th_insti_name;
	}
	public String getTh_group() {
		return th_group;
	}
	public void setTh_group(String th_group) {
		this.th_group = th_group;
	}
	public String getTh_page() {
		return th_page;
	}
	public void setTh_page(String th_page) {
		this.th_page = th_page;
	}
	public String getTh_prof() {
		return th_prof;
	}
	public void setTh_prof(String th_prof) {
		this.th_prof = th_prof;
	}
	public String getTh_public_date() {
		return th_public_date;
	}
	public void setTh_public_date(String th_public_date) {
		this.th_public_date = th_public_date;
	}
	public String getTh_regdate() {
		return th_regdate;
	}
	public void setTh_regdate(String th_regdate) {
		this.th_regdate = th_regdate;
	}
	
	
}
