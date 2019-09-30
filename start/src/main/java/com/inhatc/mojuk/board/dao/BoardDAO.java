package com.inhatc.mojuk.board.dao;

import java.util.List;
import java.util.Map;

import com.inhatc.mojuk.board.vo.AcVO;
import com.inhatc.mojuk.board.vo.BoardVO;
import com.inhatc.mojuk.board.vo.Criteria;
import com.inhatc.mojuk.board.vo.EduVO;
import com.inhatc.mojuk.board.vo.ProfileVO;
import com.inhatc.mojuk.board.vo.ThWriterVO;
import com.inhatc.mojuk.board.vo.ThesisVO;

public interface BoardDAO {
	/* =========================         Profile Board Dao       ===========================*/
	//목록 전체 select
	public List<ProfileVO> allMember() throws Exception;
	public List<EduVO> oneEdu(int idx) throws Exception;
	public List<AcVO> oneAc(int idx) throws Exception;
	public Map<String, Object> oneImage(int idx) throws Exception;
	public List<Map<String, Object>> getByteImage() throws Exception;
	public List<ThWriterVO> myThNum(String stu_no) throws Exception;
	public int countList() throws Exception;
	
	//첫 작성 및 수정
	public String profileYesNo(String stu_no) throws Exception;
	public ProfileVO myProfile(String stu_no) throws Exception;
	
	public void updateMember(ProfileVO vo,Map<String, Object> hmap) throws Exception;
	public void deleteEduAc(int pf_idx) throws Exception;
	
	
	//맴버 등록 insert
	public void registerMember(ProfileVO vo, Map<String, Object> hmap) throws Exception;
	public String pf_selectbno() throws Exception;
	public void insertEdu(Map<String, Object> list) throws Exception;
	public void insertAc(Map<String, Object> list) throws Exception;
	
	//test
	public void saveImage(String bno, Map<String, Object> hmap) throws Exception;
	public Map<String,Object> getByteImageTest() throws Exception;
	
	
	
	/* =========================         Jurnal Page Board Dao      ===========================*/
	
	public void register(ThesisVO thvo) throws Exception;
	
	public void registerFile(Map<String, Object>map)  throws Exception;
	
	public String th_selectbno() throws Exception;
	
	public List<ThesisVO> th_listAll(Criteria cri) throws Exception;
	
	public List<String> th_writerList(int th_bno) throws Exception;
	
	public Map<String, Object> th_read(Integer bno) throws Exception;
	
	public List<Map<String, Object>> th_selectFileList(Integer bno) throws Exception;
	
	public void th_delete(Integer th_bno) throws Exception;
	
	public void th_update(ThesisVO thvo) throws Exception;
	
	public void th_register_writers(ThWriterVO thwvo) throws Exception;
	
	public List<Map<String, Object>> th_read_writer(Integer bno) throws Exception;
	
	/* ======================         Toc&Project Page Board Dao       ========================*/
	public void pro_insertFile(Map<String, Object>map) throws Exception;
	public List<Map<String, Object>> pro_fileImg() throws Exception;
	
	public List<BoardVO> listAll(Criteria cri) throws Exception;

	public int countPaging(Criteria cri) throws Exception;
	
	public void create(BoardVO board) throws Exception;
	
	public void insertFile(Map<String, Object>map) throws Exception;

	public Map<String, Object> read(Integer bno) throws Exception;
	
	public List<BoardVO> fileImg() throws Exception;
	//board ���
	public List<Map<String, Object>> selectFileList(Integer bno) throws Exception;

	public String selectbno() throws Exception;
}