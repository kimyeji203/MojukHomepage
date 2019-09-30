package com.inhatc.mojuk.gallery.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inhatc.mojuk.gallery.vo.Criteria;
import com.inhatc.mojuk.gallery.vo.GalleryImgVO;
import com.inhatc.mojuk.gallery.vo.GalleryVO;

@Repository
public class GalleryDAOImpl implements GalleryDAO{
	
	@Autowired
	private SqlSession session;
	private static String namespace="com.inhatc.mapper.gallery_BoardMapper";
	
	/* gallery : read detail info */
	@Override
	public GalleryVO readOneInfo(String bno) throws Exception{
		return session.selectOne(namespace + ".readOneInfo", bno);
	}
	
	@Override
	public List<GalleryImgVO> readOneImages(String bno) throws Exception{
		return session.selectList(namespace + ".readOneImages", bno);
	}
	
	/* gallery : register the gallery */
	@Override
	public void regist(GalleryVO vo) throws Exception{
		session.insert(namespace+".regist",vo);
	}
	
	@Override
	public void registImg(GalleryImgVO vo) throws Exception{
		vo.setBoard_no((String)session.selectOne(namespace + ".getbno"));
		session.insert(namespace+".registImges", vo);
	}
	
	/* gallery : show. gallery all */
	@Override
	public List<GalleryVO> getAll() throws Exception{
		return session.selectList(namespace + ".getAll");
	}
	
	@Override
	public GalleryImgVO getImg(String bno) throws Exception{
		return session.selectOne(namespace+".getImg",bno);
	}
	
	/* gallery : delete*/
	@Override
	public void deleteInfo(int bno) throws Exception{
		session.delete(namespace + ".deleteInfo", bno);
	}
	
	@Override
	public void deleteImages(int bno) throws Exception{
		session.delete(namespace + ".deleteImages", bno);
	}
	
	/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
	@Override
	public List<GalleryVO> listAll(Criteria cri) throws Exception{
		System.out.println("(�� �Խ���)DAO��");
		
		return session.selectList(namespace + ".listAll", cri);
	}
	/*List<BoardVO>: �迭*/
	
	
	@Override
	public int countPaging(Criteria cri) throws Exception{
		
		return session.selectOne(namespace +".countPaging", cri);
	}
	
	
	
	public void addAttach(String fullName) throws Exception{
		session.insert("com.inhatc.mapper.gallery_BoardMapper.create",fullName);
	}
	
	
	
}
	
