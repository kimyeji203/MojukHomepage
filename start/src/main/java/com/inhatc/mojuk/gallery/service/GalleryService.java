package com.inhatc.mojuk.gallery.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.transaction.annotation.Transactional;

import com.inhatc.mojuk.gallery.vo.Criteria;
import com.inhatc.mojuk.gallery.vo.GalleryVO;


@Transactional
public interface GalleryService{
	
	public List<GalleryVO> listAll(GalleryVO vo, Criteria cri, HttpSession ses) throws Exception;
	public int listCountCriteria(Criteria cri, HttpSession ses) throws Exception;
	public void regist(GalleryVO vo) throws Exception;
	public List<?> getAll() throws Exception;
	public Map<String, Object> readOne(String bno) throws Exception;
	public void delete(int bno) throws Exception;
}