package com.inhatc.mojuk.participate.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.inhatc.mojuk.participate.dao.PartiDAO;
import com.inhatc.mojuk.participate.service.PartiService;
import com.inhatc.mojuk.participate.vo.PartiVO;

@Service
public class PartiServiceImpl implements PartiService{

	
	@Autowired
	private PartiDAO dao;
	
	@Override
	public PartiVO readone(String stu_num) throws Exception{
		return dao.readone(stu_num);
	}
	
	@Override
	public List<PartiVO> readAll() throws Exception{
		return dao.readAll();
	}
	
	@Override
	public void update(PartiVO vo) throws Exception{
		dao.update(vo);
	}
}
