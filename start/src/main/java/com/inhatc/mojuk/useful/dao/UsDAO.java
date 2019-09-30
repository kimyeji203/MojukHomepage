package com.inhatc.mojuk.useful.dao;

import java.util.List;

import com.inhatc.mojuk.useful.vo.UsVO;

public interface UsDAO {

	public void insert(UsVO usvo) throws Exception;
	public List<UsVO> listAll() throws Exception;
}
