package com.inhatc.mojuk.main.dao;

import java.util.Map;

import com.inhatc.mojuk.main.vo.JoinVO;

public interface MainDAO {
	public void joinup(JoinVO vo) throws Exception;
	public JoinVO loginup(String no, String pw) throws Exception;
	
	public void insertParti(Map<String, Object> map) throws Exception;
}
