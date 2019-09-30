package com.inhatc.mojuk.useful.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.inhatc.mojuk.useful.vo.UsVO;

@Repository
public class UsDAOImpl implements UsDAO{

	@Autowired
	private SqlSession session;
	private static String namespace = "com.inhatc.mapper.usefulMapper";
	
	@Override
	public void insert(UsVO usvo) throws Exception{
		session.insert(namespace +".insert",usvo);
	}
	
	@Override
	public List<UsVO> listAll() throws Exception{
		return session.selectList(namespace + ".listAll");
	}
}
