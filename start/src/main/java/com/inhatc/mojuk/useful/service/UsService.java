package com.inhatc.mojuk.useful.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;
import com.inhatc.mojuk.useful.vo.UsVO;

@Transactional
public interface UsService {
	public void insert(UsVO usvo) throws Exception;
	public List<UsVO> listAll() throws Exception;
}
