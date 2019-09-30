package com.inhatc.mojuk.common.dao;

import java.util.Map;

public interface CommonDAO {
	
	public Map<String, Object> selectFileInfo(int bno) throws Exception;
	public Map<String,Object> th_fileDownLoad(int bno) throws Exception;
	
}
