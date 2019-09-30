package com.inhatc.mojuk.main.service;

import com.inhatc.mojuk.main.vo.JoinVO;

public interface MainService {
	public void joinup(JoinVO vo) throws Exception;
	public JoinVO loginup(String no, String pw) throws Exception;
}
