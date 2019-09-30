package com.inhatc.mojuk.main.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inhatc.mojuk.main.dao.MainDAO;
import com.inhatc.mojuk.main.dao.MainDAOImpl;
import com.inhatc.mojuk.main.vo.JoinVO;

@Service
public class MainServiceImpl implements MainService{
	@Autowired
	MainDAO dao;
	
	@Override
	public void joinup(JoinVO vo) throws Exception{
		dao.joinup(vo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stu_no", vo.getStu_no());
		map.put("stu_name",vo.getStu_name());
		dao.insertParti(map);
	}
	
	@Override
	public JoinVO loginup(String no, String pw) throws Exception{
		return dao.loginup(no, pw);
	}

}
