package com.inhatc.mojuk.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.transaction.annotation.Transactional;
import com.inhatc.mojuk.board.vo.BoardVO;
import com.inhatc.mojuk.board.vo.Criteria;
import com.inhatc.mojuk.board.vo.ProfileVO;
import com.inhatc.mojuk.board.vo.ThesisVO;

@Transactional
public interface BoardService{
	/* =========================         Profile Board Service       ===========================*/
	public String profileYesNo(String stu_no) throws Exception;
	public Map<String, Object> pf_myInfo(String stu_no) throws Exception;
	
	//목록 조회 select
	public List<Map<String, Object>> pf_allMember() throws Exception;
	public List<Map<String, Object>> getByteImage() throws Exception;
	
	//멤버 등록 insert
	public void registerMember(ProfileVO vo, Map<String, Object> hmap) throws Exception;
	
	//update
	public void updateMember(ProfileVO vo, Map<String, Object> hmap) throws Exception;

	//test
	public void saveImage(String bno, Map<String, Object> hmap) throws Exception;
	public Map<String, Object> getByteImageTest() throws Exception;
	
	
	/* =========================         Jurnal Page Board Service      ===========================*/
	public int countList() throws Exception;
	
	public void th_register(ThesisVO thvo,HttpServletRequest request) throws Exception;
	
	public List<ThesisVO> th_listAll(ThesisVO thvo, Criteria cri, HttpSession ses) throws Exception;
	
	public Map<String, Object> th_read(Integer bno) throws Exception;
	
	public void th_delete(Integer th_bno) throws Exception;
	
	public void th_update(ThesisVO thvo) throws Exception;
	
	public List<Map<String, Object>> th_read_writer(Integer bno) throws Exception;
	
	/* ======================         Toc&Project Page Board Service       ========================*/
	public void pro_regist(BoardVO board,HttpServletRequest request) throws Exception;
	public List<String> pro_fileImg() throws Exception;
	
	//board ���
	public List<BoardVO> listAll(BoardVO board, Criteria cri, HttpSession ses) throws Exception;
	
	public int listCountCriteria(Criteria cri, HttpSession ses) throws Exception;
	
	public void regist(BoardVO board,HttpServletRequest request) throws Exception;

	public Map<String, Object> read(Integer bno) throws Exception;
	
	public List<BoardVO> fileImg(BoardVO board) throws Exception;

	
}