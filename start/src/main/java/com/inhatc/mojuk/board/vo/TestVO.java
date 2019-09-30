package com.inhatc.mojuk.board.vo;

import org.springframework.web.multipart.MultipartFile;

public class TestVO {
	private MultipartFile imgFile;

	public MultipartFile getImgFile() {
		return imgFile;
	}
	public void setImgFile(MultipartFile imgFile) {
		this.imgFile = imgFile;
	}
	
}
