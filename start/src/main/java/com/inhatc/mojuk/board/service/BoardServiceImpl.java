package com.inhatc.mojuk.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.inhatc.mojuk.board.controller.BoardController;
import com.inhatc.mojuk.board.dao.BoardDAO;
import com.inhatc.mojuk.board.vo.AcVO;
import com.inhatc.mojuk.board.vo.BoardVO;
import com.inhatc.mojuk.board.vo.Criteria;
import com.inhatc.mojuk.board.vo.EduVO;
import com.inhatc.mojuk.board.vo.ProfileVO;
import com.inhatc.mojuk.board.vo.ThWriterVO;
import com.inhatc.mojuk.board.vo.ThesisVO;
import com.inhatc.mojuk.core.util.FileUtils;
import com.inhatc.mojuk.core.util.ThFileUtils;
import com.inhatc.mojuk.main.vo.JoinVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardDAO dao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="thFileUtils")
	private ThFileUtils thFileUtils;
	
	/* =========================          Profile Board Service      ===========================*/
	@Override
	public String profileYesNo(String stu_no) throws Exception{
		return dao.profileYesNo(stu_no);
	}
	
	@Override
	public Map<String, Object> pf_myInfo(String stu_no) throws Exception{
		Map<String, Object> result = new HashMap<String, Object>();
		ProfileVO myInfo = dao.myProfile(stu_no);
		
		//image - 수정해야함.
		Map<String,Object> img = dao.oneImage(myInfo.getPf_idx());
		byte[] imgContent = Base64.encodeBase64((byte[]) img.get("pf_img"));
		String imgStr = new String(imgContent);
		
		result.put("myInfo", myInfo);
		result.put("myEdu", dao.oneEdu(myInfo.getPf_idx()));
		result.put("myAc", dao.oneAc(myInfo.getPf_idx()));
		result.put("myImg", imgStr);
		
		return result;
	}
	
	//목록 select
	@Override
	public List<Map<String, Object>> pf_allMember() throws Exception{
		List<Map<String, Object>> resultMember = new ArrayList<Map<String, Object>>();
		Map<String, Object> oneMember = null;
		
		List<ProfileVO> member = dao.allMember();
		for(int i=0; i< member.size(); i++) {
			oneMember = new HashMap<String, Object>();
			//base info
			int member_idx = member.get(i).getPf_idx();
			List<EduVO> edu = dao.oneEdu(member_idx);
			List<AcVO> ac = dao.oneAc(member_idx);
			
			//image
			Map<String,Object> img = dao.oneImage(member_idx);
			byte[] imgContent = Base64.encodeBase64((byte[]) img.get("pf_img"));
			String imgStr = new String(imgContent);
			
			//thesis
			List<ThWriterVO> myThNumList = dao.myThNum(member.get(i).getPf_stu_no());
			List<Map<String, Object>> thesis = new ArrayList<Map<String, Object>>();
			Map<String, Object> oneThesis = null;
			for(int t=0;t<myThNumList.size();t++) {
				oneThesis = dao.th_read(myThNumList.get(t).getTh_bno());
				thesis.add(oneThesis);
			}
			
			logger.info(">>>>>>>>>>>>>>>>>>>>      " + member.get(i).toString() + "       <<<<<<<<<<<<<<<<<<<<<<<<<");
			
			
			oneMember.put("my_thesis",thesis);
			
			
			oneMember.put("my_info", member.get(i)); //ProfileVO
			oneMember.put("my_edu", edu); //List<EduVO>
			oneMember.put("my_ac", ac); //List<AcVO>
			oneMember.put("my_img", imgStr); //imgByte
			//oneMember.put("my_img", reImg);
			
			resultMember.add(oneMember);
		}
		
		
		
		return resultMember;
	}
	
	
	
	@Override
	public List<Map<String, Object>> getByteImage() throws Exception{
		return dao.getByteImage();
	}
	
	
	//맴버 information update
	@Override
	public void updateMember(ProfileVO vo,Map<String, Object> hmap) throws Exception{
		dao.updateMember(vo,hmap);
		dao.deleteEduAc(vo.getPf_idx());
		
		
		
		int bno = vo.getPf_idx();
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;
		
		//pf_education table insert
		try {
			for(int i=0; i<vo.getEdu().size(); i++) {
				if(vo.getEdu().get(i).getUniversity() == null || vo.getEdu().get(i).getDepart() == null) {
					continue;
				}
				listMap = new HashMap<String, Object>();
				listMap.put("member_idx", bno);
				listMap.put("university", vo.getEdu().get(i).getUniversity());
				listMap.put("depart", vo.getEdu().get(i).getDepart());
				list.add(listMap);
				
				dao.insertEdu(list.get(i));
			}
			list.clear();	
		}catch(Exception e) {
			logger.info("No data edu...");
		}
		
		try {
			//pf_ac table insert
			for(int i=0;i<vo.getAc().size(); i++) {
				if(vo.getAc().get(i).getType() == null) {
					continue;
				}
				listMap = new HashMap<String,Object>();
				listMap.put("member_idx", bno);
				listMap.put("type", vo.getAc().get(i).getType());
				listMap.put("name", vo.getAc().get(i).getName());
				listMap.put("host", vo.getAc().get(i).getHost());
				listMap.put("date", vo.getAc().get(i).getDate());
				list.add(listMap);
				
				dao.insertAc(list.get(i));
			}
			list.clear();
		}catch(Exception e) {
			logger.info("No data ac..");
		}	
	}
	

	
	//맴버 등록 insert
	@Override
	public void registerMember(ProfileVO vo, Map<String, Object> hmap) throws Exception{
		dao.registerMember(vo,hmap);
		
		//test
		String bno = dao.pf_selectbno();
		//dao.saveImage(bno,hmap);
		
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;
		
		//pf_education table insert
		try {
			for(int i=0; i<vo.getEdu().size(); i++) {
				if(vo.getEdu().get(i).getUniversity() == null || vo.getEdu().get(i).getDepart() == null) {
					continue;
				}
				listMap = new HashMap<String, Object>();
				listMap.put("member_idx", bno);
				listMap.put("university", vo.getEdu().get(i).getUniversity());
				listMap.put("depart", vo.getEdu().get(i).getDepart());
				list.add(listMap);
				
				dao.insertEdu(list.get(i));
			}
			list.clear();	
		}catch(Exception e) {
			logger.info("No data edu...");
		}
		
		try {
			//pf_ac table insert
			for(int i=0;i<vo.getAc().size(); i++) {
				if(vo.getAc().get(i).getType() == null) {
					continue;
				}
				listMap = new HashMap<String,Object>();
				listMap.put("member_idx", bno);
				listMap.put("type", vo.getAc().get(i).getType());
				listMap.put("name", vo.getAc().get(i).getName());
				listMap.put("host", vo.getAc().get(i).getHost());
				listMap.put("date", vo.getAc().get(i).getDate());
				list.add(listMap);
				
				dao.insertAc(list.get(i));
			}
			list.clear();
		}catch(Exception e) {
			logger.info("No data ac..");
		}	
	}
	
	//test
	@Override
	public void saveImage(String bno, Map<String, Object> hmap) throws Exception{
		dao.saveImage(bno, hmap);
	}
	
	@Override
	public Map<String, Object> getByteImageTest() throws Exception{
		return dao.getByteImageTest();
	}
	
	/* =========================         Jurnal Page Board Service      ===========================*/
	@Override
	public int countList() throws Exception{
		return dao.countList();
	}
	
	@Override
	public List<ThesisVO> th_listAll(ThesisVO thvo, Criteria cri, HttpSession ses) throws Exception{
		List<ThesisVO> th_listAll = dao.th_listAll(cri);
		for(int i=0; i< th_listAll.size();i++) {
			int th_bno = th_listAll.get(i).getTh_bno();
			th_listAll.get(i).setTh_writerNames(dao.th_writerList(th_bno));
		}
		return th_listAll;
	}
	
	@Override
	public void th_update(ThesisVO thvo) throws Exception{
		dao.th_update(thvo);
		
		int th_bno = thvo.getTh_bno();
		Map<String, Object> listMap = null;
		
		for(int i=0; i<thvo.getTh_writers().size();i++) {
			listMap = new HashMap<String, Object>();
			
			thvo.getTh_writers().get(i).setTh_bno(th_bno);
			ThWriterVO writers = thvo.getTh_writers().get(i);
			
			dao.th_register_writers(writers);
		}
	}
	
	@Override
	public void th_delete(Integer th_bno) throws Exception{
		dao.th_delete(th_bno);
	}
	
	@Override
	public Map<String, Object> th_read(Integer bno) throws Exception{
	    return dao.th_read(bno);
	}
	
	@Override
	public List<Map<String, Object>> th_read_writer(Integer bno) throws Exception{
		return dao.th_read_writer(bno);
	}
	
	@Override
	public void th_register(ThesisVO thvo,HttpServletRequest request) throws Exception{
		dao.register(thvo);
		
		String th_bno = dao.th_selectbno();
		Map<String, Object> listMap = null;
		
		for(int i=0; i<thvo.getTh_writers().size();i++) {
			listMap = new HashMap<String, Object>();
			
			thvo.getTh_writers().get(i).setTh_bno(Integer.parseInt(th_bno));
			ThWriterVO writers = thvo.getTh_writers().get(i);
			
			dao.th_register_writers(writers);
		}
	}
	
	/* ======================         Toc&Project Page Board Dao       ========================*/
	@Override
	public void pro_regist(BoardVO board, HttpServletRequest request) throws Exception {
		dao.create(board);
		String bno = dao.selectbno();
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		
		while(iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				System.out.println("--------------------- file start ---------------------");
				System.out.println("name: " +multipartFile.getName());
				System.out.println("filename: "+multipartFile.getOriginalFilename());
				System.out.println("size: " +multipartFile.getSize());
				System.out.println("--------------------- file end -----------------------\n");
				
			}
		}
		
		//fileUtils.setfilePath("");
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(bno ,request);
		System.out.println(list);
		System.out.println(list.get(0));
		for(int i=0, size=list.size(); i<size; i++) {
/*
			Map<String, Object> fileMap = new HashMap<String, Object>();
			fileMap.put("file", board.getMulti_file().getBytes());
	*/
			dao.pro_insertFile(list.get(i));
			/*['�Խù���ȣ','�����̸�','���� ������']*/
		}
	}
	
	
	@Override
	public List<String> pro_fileImg() throws Exception{
		
		List<Map<String, Object>> fileImages = dao.pro_fileImg();
		List<String> resultList = new ArrayList<String>();
		byte[] imgContent = null;
		
		
		for(int i=0, size=fileImages.size(); i<size;i++) {
			imgContent = Base64.encodeBase64((byte[]) fileImages.get(i).get("MULTI_FILE"));
			String imgStr = new String(imgContent);
			resultList.add(imgStr);
		}
		
		return resultList;
	}
	
	
	//board ���
	@Override
	public List<BoardVO> listAll(BoardVO board, Criteria cri, HttpSession ses) throws Exception {
		
		return dao.listAll(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri, HttpSession ses) throws Exception {
		
		return dao.countPaging(cri);
	}
	

	@Override
	public void regist(BoardVO board, HttpServletRequest request) throws Exception {
		dao.create(board);
		String bno = dao.selectbno();
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		
		while(iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				System.out.println("--------------------- file start ---------------------");
				System.out.println("name: " +multipartFile.getName());
				System.out.println("filename: "+multipartFile.getOriginalFilename());
				System.out.println("size: " +multipartFile.getSize());
				System.out.println("--------------------- file end -----------------------\n");
				
			}
		}
		
		//fileUtils.setfilePath("");
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(bno ,request);
		System.out.println(list);
		System.out.println(list.get(0));
		for(int i=0, size=list.size(); i<size; i++) {
			dao.insertFile(list.get(i));
			/*['�Խù���ȣ','�����̸�','���� ������']*/
		}
	}
	
	@Override
	public Map<String, Object> read(Integer bno) throws Exception {
	    Map<String, Object> resultMap = new HashMap<String,Object>();
	    Map<String, Object> tempMap = dao.read(bno);
	    resultMap.put("map", tempMap);
	     
	    List<Map<String,Object>> list = dao.selectFileList(bno);
	    resultMap.put("list", list);

	    return resultMap;
	}
	
	
	@Override
	public List<BoardVO> fileImg(BoardVO board) throws Exception {

		
	    return dao.fileImg();
	}
}