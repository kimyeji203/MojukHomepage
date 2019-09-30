package com.inhatc.mojuk.gallery.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inhatc.mojuk.core.util.FileUtils;
import com.inhatc.mojuk.gallery.dao.GalleryDAO;
import com.inhatc.mojuk.gallery.vo.Criteria;
import com.inhatc.mojuk.gallery.vo.GalleryImgVO;
import com.inhatc.mojuk.gallery.vo.GalleryVO;

@Service
public  class GalleryServiceImpl implements GalleryService {
	
	@Autowired
	private GalleryDAO dao;

	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	

	@Override
	public Map<String, Object> readOne(String bno) throws Exception{
		Map<String, Object> result = new HashMap<String, Object>();
		List<GalleryImgVO> imgList = dao.readOneImages(bno);
		
		
		List<Map<String, Object>> readImages = new ArrayList<Map<String, Object>>();
		for(int i=0; i< imgList.size(); i++) {
			Map<String, Object> imgMap = new HashMap<String, Object>();
			byte[] imgContent = Base64.encodeBase64((byte[]) imgList.get(i).getGallery_img());
			String imgStr = new String(imgContent);
			
			String imgTitle = null;
			imgTitle = imgList.get(i).getGallery_img_title();
			
			imgMap.put("imgSrc", imgStr);
			imgMap.put("imgTitle",imgTitle);
			
			readImages.add(imgMap);
		}
		
		
		result.put("readInfo", dao.readOneInfo(bno));
		result.put("readImages", readImages);
		
		return result;
	}
	
	
	@Override
	public void regist(GalleryVO vo) throws Exception {
		dao.regist(vo);
		
		
		List<GalleryImgVO> imges = vo.getFile();
		
		for(int i=0; i< imges.size(); i++) {
			if(imges.get(i) != null) {
				byte[] imgsByte = imges.get(i).getGallery_img_multi().getBytes();
				imges.get(i).setGallery_img(imgsByte);
				dao.registImg(imges.get(i));
			}
		}
		
	}
	
	@Override
	public List<?> getAll() throws Exception{
		List<Map<String, Object>> mapResult = new ArrayList<Map<String, Object>>();
		
		List<GalleryVO> getAll = dao.getAll();
		for(int i=0; i< getAll.size();i++) {
			String bno = getAll.get(i).getBoard_no();
			GalleryImgVO mainImg = dao.getImg(bno);
			
			byte[] imgContent = Base64.encodeBase64((byte[]) mainImg.getGallery_img());
			String imgStr = new String(imgContent);
			
			Map<String, Object> mapOne = new HashMap<String, Object>();
			mapOne.put("galleryInfo", getAll.get(i));
			mapOne.put("mainImg",imgStr); //vo byte형과 mutiputfile형 둘다 있음. 에러시 참고.
			
			mapResult.add(mapOne);
		}
		
		return mapResult;
	}	
	
	@Override
	public void delete(int bno) throws Exception{
		dao.deleteInfo(bno);
		dao.deleteImages(bno);
	}
	
	/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
	@Override
	public List<GalleryVO> listAll(GalleryVO vo, Criteria cri, HttpSession ses) throws Exception {
		
		return dao.listAll(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri, HttpSession ses) throws Exception {
		
		return dao.countPaging(cri);
	}
	
	

}