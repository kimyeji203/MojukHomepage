package com.inhatc.mojuk.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inhatc.mojuk.board.vo.AcVO;
import com.inhatc.mojuk.board.vo.BoardVO;
import com.inhatc.mojuk.board.vo.Criteria;
import com.inhatc.mojuk.board.vo.EduVO;
import com.inhatc.mojuk.board.vo.ProfileVO;
import com.inhatc.mojuk.board.vo.ThWriterVO;
import com.inhatc.mojuk.board.vo.ThesisVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Autowired
	private SqlSession session;
	
	private static String namespace="com.inhatc.mapper.toc_BoardMapper";
	private static String th_namespace = "com.inhatc.mapper.th_BoardMapper";
	private static String test = "com.inhatc.mapper.test_BoardMapper";
	private static String pf_namespace = "com.inhatc.mapper.pf_BoardMapper";
	private static String join_namespace = "com.inhatc.mapper.joinMapper";
	
	
	/* =========================         profile Board Dao       ===========================*/
	
	//profile update
	@Override
	public void updateMember(ProfileVO vo,Map<String, Object> hmap) throws Exception{
		Map<String, Object> pf = new HashMap<String, Object>();
		pf.put("pf", vo);
		pf.put("img", hmap);
		session.update(pf_namespace + ".updateMember", pf);
	}
	
	@Override
	public void deleteEduAc(int pf_idx) throws Exception{
		session.delete(pf_namespace + ".deleteEdu", pf_idx);
		session.delete(pf_namespace + ".deleteAc", pf_idx);
	}
	
	@Override
	public String profileYesNo(String stu_no) throws Exception{
		return session.selectOne(join_namespace+".profileYN",stu_no);
	}
	@Override
	public ProfileVO myProfile(String stu_no) throws Exception{
		return session.selectOne(pf_namespace + ".myProfile", stu_no);
	}
	
	//select
	@Override
	public List<ProfileVO> allMember() throws Exception{
		return session.selectList(pf_namespace + ".allMember");
	}
	@Override
	public List<EduVO> oneEdu(int idx) throws Exception{
		return session.selectList(pf_namespace+".oneEdu",idx);
	} 
	@Override
	public List<AcVO> oneAc(int idx) throws Exception{
		return session.selectList(pf_namespace+".oneAc",idx);
	}
	
	@Override
	public List<ThWriterVO> myThNum(String stu_no) throws Exception{
		return session.selectList(pf_namespace+".myThNum",stu_no);
	}
	
	@Override
	public Map<String, Object> oneImage(int idx) throws Exception{
		return session.selectOne(pf_namespace+".oneImage", idx);
	}
	
	@Override
	public List<Map<String, Object>> getByteImage() throws Exception{
		return session.selectList(pf_namespace+".getByteImage");
	}
	
	//insert
	@Override
	public void insertEdu(Map<String, Object> list) throws Exception{
		session.insert(pf_namespace + ".insertEdu", list);
	}
	@Override
	public void insertAc(Map<String, Object> list) throws Exception{
		session.insert(pf_namespace + ".insertAc", list);
	}
	@Override
	public void registerMember(ProfileVO vo, Map<String, Object> hmap) throws Exception{
		session.update(join_namespace+".changeYN", vo.getPf_stu_no());
		
		Map<String,Object> pfVO = new HashMap<String, Object>();
		pfVO.put("pfvo", vo);
		pfVO.put("img", hmap);
		
		session.insert(pf_namespace + ".registerMember", pfVO);
	}
	@Override
	public String pf_selectbno() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(pf_namespace + ".selectbno");
		
	}
	
	//test
	@Override
	public void saveImage(String bno, Map<String, Object> hmap) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("img", hmap);
		session.insert(test + ".saveImage",map);
	}
	
	@Override
	public Map<String, Object> getByteImageTest() throws Exception{
		return session.selectOne(test+".getByteImageTest");
	}

	/* =========================         Jurnal Page Board Dao      ===========================*/
	
	@Override
	public int countList() throws Exception{
		return (Integer) session.selectOne(th_namespace+".countList");
	}
	
	@Override
	public List<ThesisVO> th_listAll(Criteria cri) throws Exception{
		return session.selectList(th_namespace + ".listAll", cri);
	}
	
	@Override
	public List<String> th_writerList(int th_bno) throws Exception{
		return session.selectList(th_namespace+".writerList",th_bno);
	}
	
	@Override
	public void th_update(ThesisVO thvo) throws Exception{
		session.update(th_namespace + ".update", thvo);
		session.delete(th_namespace + ".deleteWriter", thvo.getTh_bno());
	}
	
	@Override
	public Map<String, Object> th_read(Integer bno) throws Exception{
		return session.selectOne(th_namespace + ".read", bno);
	}
	
	@Override
	public List<Map<String, Object>> th_read_writer(Integer bno) throws Exception{
		return session.selectList(th_namespace+".readWriter", bno);
	}
	
	@Override
	public List<Map<String, Object>> th_selectFileList(Integer bno) throws Exception{
		return session.selectList(th_namespace + ".selectFileList", bno);
	}
	
	@Override
	public void register(ThesisVO thvo) throws Exception{
		session.insert(th_namespace+".register",thvo);
	}
	
	@Override
	public void th_register_writers(ThWriterVO thwvo) throws Exception{
		session.insert(th_namespace+".registWriter",thwvo);
	}
	
	@Override
	public void registerFile(Map<String, Object> map) throws Exception{
		session.insert(th_namespace+".registerFile",map);
	}
	
	@Override
	public String th_selectbno() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(th_namespace + ".selectbno");
		
	}
	
	@Override
	public void th_delete(Integer th_bno) throws Exception{
		session.delete(th_namespace + ".delete", th_bno);
		session.delete(th_namespace + ".deleteWriter", th_bno);
	}
	
	/* ======================         Toc&Project Page Board Dao       ========================*/
	
	/* project Board DAO */
	@Override
	public void pro_insertFile(Map<String, Object> map) throws Exception{
		session.insert("com.inhatc.mapper.toc_BoardMapper.pro_insertFile", map);
	}
	
	public List<Map<String, Object>> pro_fileImg() throws Exception{
		return session.selectList(namespace + ".pro_fileImgs");
	}
	
	@Override
	public List<BoardVO> listAll(Criteria cri) throws Exception{
		System.out.println("(�� �Խ���)DAO��");
		
		return session.selectList(namespace + ".listAll", cri);
	}
	/*List<BoardVO>: �迭*/
	
	@Override
	public int countPaging(Criteria cri) throws Exception{
		
		return session.selectOne(namespace +".countPaging", cri);
	}
	
	@Override
	public void create(BoardVO board) throws Exception{
		session.insert(namespace+".create",board);
	}
	
	@Override
	public void insertFile(Map<String, Object> map) throws Exception{
		
		session.insert("com.inhatc.mapper.toc_BoardMapper.insertFile", map);
	}
	
	@Override
	public Map<String, Object> read(Integer bno) throws Exception{
		
		return session.selectOne(namespace + ".read", bno);
	}

	@Override
	public List<BoardVO> fileImg() throws Exception{
		return session.selectList(namespace + ".selectFileImg");
	}

	@Override
	public String selectbno() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".selectbno");
		
	}

	//board ���
	@Override
	public List<Map<String, Object>> selectFileList(Integer bno) throws Exception {
		
		return session.selectList(namespace + ".selectFileList", bno);
	}
	
}
	
