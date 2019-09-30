package com.inhatc.mojuk.participate.dao;

import com.inhatc.mojuk.participate.vo.PartiVO;
import java.util.List;

public interface PartiDAO {
	public PartiVO readone(String stu_num) throws Exception;
	public List<PartiVO> readAll() throws Exception;
	public void update(PartiVO vo) throws Exception;
}
