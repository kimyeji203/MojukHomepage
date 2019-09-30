package com.inhatc.mojuk.participate.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;
import com.inhatc.mojuk.participate.vo.PartiVO;

@Transactional
public interface PartiService {
	public PartiVO readone(String stu_num) throws Exception;
	public List<PartiVO> readAll() throws Exception;
	public void update(PartiVO vo) throws Exception;
}
