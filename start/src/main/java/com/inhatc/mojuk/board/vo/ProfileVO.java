package com.inhatc.mojuk.board.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ProfileVO {
	private int pf_idx;
	private String pf_stu_no;
	private String pf_stu_birthday;
	private String pf_stu_name;
	private String pf_stu_email;
	private MultipartFile pf_img;
	private List<EduVO> edu;
	private List<AcVO> ac;
	
	
	public List<EduVO> getEdu() {
		return edu;
	}
	public void setEdu(List<EduVO> edu) {
		this.edu = edu;
	}
	public List<AcVO> getAc() {
		return ac;
	}
	public void setAc(List<AcVO> ac) {
		this.ac = ac;
	}
	public int getPf_idx() {
		return pf_idx;
	}
	public void setPf_idx(int pf_idx) {
		this.pf_idx = pf_idx;
	}
	public String getPf_stu_no() {
		return pf_stu_no;
	}
	public void setPf_stu_no(String pf_stu_no) {
		this.pf_stu_no = pf_stu_no;
	}
	public String getPf_stu_birthday() {
		return pf_stu_birthday;
	}
	public void setPf_stu_birthday(String pf_stu_birthday) {
		this.pf_stu_birthday = pf_stu_birthday;
	}
	public String getPf_stu_name() {
		return pf_stu_name;
	}
	public void setPf_stu_name(String pf_stu_name) {
		this.pf_stu_name = pf_stu_name;
	}
	public String getPf_stu_email() {
		return pf_stu_email;
	}
	public void setPf_stu_email(String pf_stu_email) {
		this.pf_stu_email = pf_stu_email;
	}
	public MultipartFile getPf_img() {
		return pf_img;
	}
	public void setPf_img(MultipartFile pf_img) {
		this.pf_img = pf_img;
	}
	
	
}
