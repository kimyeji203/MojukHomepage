package com.inhatc.mojuk.gallery.vo;

import org.springframework.web.multipart.MultipartFile;

public class GalleryImgVO {
	private String idx;
	private String board_no;
	private String gallery_img_title;	
	private MultipartFile gallery_img_multi;
	private byte[] gallery_img;
	
	
	public String getGallery_img_title() {
		return gallery_img_title;
	}
	public void setGallery_img_title(String gallery_img_title) {
		this.gallery_img_title = gallery_img_title;
	}
	public MultipartFile getGallery_img_multi() {
		return gallery_img_multi;
	}
	public void setGallery_img_multi(MultipartFile gallery_img_multi) {
		this.gallery_img_multi = gallery_img_multi;
	}
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getBoard_no() {
		return board_no;
	}
	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}
	public byte[] getGallery_img() {
		return gallery_img;
	}
	public void setGallery_img(byte[] gallery_img) {
		this.gallery_img = gallery_img;
	}
	
}
