package com.inhatc.mojuk.gallery.dao;

import java.util.List;

import com.inhatc.mojuk.gallery.vo.Criteria;
import com.inhatc.mojuk.gallery.vo.GalleryImgVO;
import com.inhatc.mojuk.gallery.vo.GalleryVO;

public interface GalleryDAO {
	
	public void regist(GalleryVO vo) throws Exception;
	public void registImg(GalleryImgVO vo) throws Exception;
	public List<GalleryVO> getAll() throws Exception;
	public GalleryImgVO getImg(String bno) throws Exception;
	public GalleryVO readOneInfo(String bno) throws Exception;
	public List<GalleryImgVO> readOneImages(String bno) throws Exception;
	public void deleteInfo(int bno) throws Exception;
	public void deleteImages(int bno) throws Exception;
	
	public List<GalleryVO> listAll(Criteria cri) throws Exception;

	public int countPaging(Criteria cri) throws Exception;
	
	public void addAttach(String fullName) throws Exception;
}