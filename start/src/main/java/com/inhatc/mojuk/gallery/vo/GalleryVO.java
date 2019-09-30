package com.inhatc.mojuk.gallery.vo;

import java.util.List;

public class GalleryVO {
	private String board_no;
	private String gallery_title;
	private String gallery_writer;
	private String gallery_writer_id;
	private String gallery_content;
	private String gallery_redate;
	private List<GalleryImgVO> file;
	
	
	public String getGallery_writer_id() {
		return gallery_writer_id;
	}
	public void setGallery_writer_id(String gallery_writer_id) {
		this.gallery_writer_id = gallery_writer_id;
	}
	public String getBoard_no() {
		return board_no;
	}
	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}
	public String getGallery_title() {
		return gallery_title;
	}
	public void setGallery_title(String gallery_title) {
		this.gallery_title = gallery_title;
	}
	public String getGallery_writer() {
		return gallery_writer;
	}
	public void setGallery_writer(String gallery_writer) {
		this.gallery_writer = gallery_writer;
	}
	public String getGallery_content() {
		return gallery_content;
	}
	public void setGallery_content(String gallery_content) {
		this.gallery_content = gallery_content;
	}
	public String getGallery_redate() {
		return gallery_redate;
	}
	public void setGallery_redate(String gallery_redate) {
		this.gallery_redate = gallery_redate;
	}
	public List<GalleryImgVO> getFile() {
		return file;
	}
	public void setFile(List<GalleryImgVO> file) {
		this.file = file;
	}
	
		
}

	
	

