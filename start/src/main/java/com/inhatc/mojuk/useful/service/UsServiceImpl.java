package com.inhatc.mojuk.useful.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.inhatc.mojuk.useful.dao.UsDAO;
import com.inhatc.mojuk.useful.vo.UsVO;

@Service
public class UsServiceImpl implements UsService{

	@Autowired
	private UsDAO dao;
	
	public void insert(UsVO usvo) throws Exception{
		dao.insert(usvo);
	}
	
	public List<UsVO> listAll() throws Exception{
		return dao.listAll();
	}
}
