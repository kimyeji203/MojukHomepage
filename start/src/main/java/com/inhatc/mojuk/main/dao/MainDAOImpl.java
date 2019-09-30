package com.inhatc.mojuk.main.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inhatc.mojuk.main.vo.JoinVO;

@Repository
public class MainDAOImpl implements MainDAO{
	@Autowired
	private SqlSession session;
	private static String namespace = "com.inhatc.mapper.joinMapper";
	private static String parti_namespace = "com.inhatc.mapper.parti_BoardMapper";
	
	@Override
	public void insertParti(Map<String, Object> map) throws Exception{
		session.insert(parti_namespace + ".insertParti",map);
	}
	
	@Override
	public void joinup(JoinVO vo) throws Exception{
		session.insert(namespace + ".joinUp", vo);
	}
	
	@Override
	public JoinVO loginup(String no, String pw) throws Exception{
		Map<String, Object> mv = new HashMap<String, Object>();
		mv.put("stu_no", no);
		mv.put("password", pw);
		JoinVO login = null;
		try {
			login = session.selectOne(namespace + ".loginUp",mv);
		}catch(NullPointerException e){
			login = null;
		}
		return login;
	}
}
