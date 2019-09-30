package com.inhatc.mojuk.participate.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;
import com.inhatc.mojuk.participate.vo.PartiVO;

@Repository
public class PartiDAOImpl implements PartiDAO{
	@Autowired
	private SqlSession session;
	private static String namespace="com.inhatc.mapper.parti_BoardMapper";
	
	@Override
	public PartiVO readone(String stu_num) throws Exception {
		
		return session.selectOne(namespace + ".readone", stu_num);
	}
	
	@Override
	public List<PartiVO> readAll() throws Exception{
		return session.selectList(namespace + ".readAll");
	}
	
	@Override
	public void update(PartiVO vo) throws Exception{
		session.update(namespace + ".update", vo);
	}
}
