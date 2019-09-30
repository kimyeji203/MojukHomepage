package com.inhatc.mojuk.common.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class CommonDAOImpl implements CommonDAO{
	
	@Autowired
	private SqlSession session;
	
	private static String namespace="com.inhatc.mapper.common";
	
	@Override
	public Map<String, Object> selectFileInfo(int bno) throws Exception{
	    return session.selectOne(namespace + ".selectFileInfo", bno);
	}

	@Override
	public Map<String, Object> th_fileDownLoad(int bno) throws Exception{
	    return session.selectOne(namespace + ".th_fileDownLoad", bno);
	}
}
