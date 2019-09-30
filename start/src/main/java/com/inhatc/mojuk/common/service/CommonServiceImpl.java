package com.inhatc.mojuk.common.service;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inhatc.mojuk.common.dao.CommonDAO;
 
 
@Service
public class CommonServiceImpl implements CommonService{
    Logger log = Logger.getLogger(this.getClass());
     
    @Autowired
    private CommonDAO commonDAO;
 
	@Override
	public Map<String, Object> selectFileInfo(int bno) throws Exception {
		// TODO Auto-generated method stub
		 return commonDAO.selectFileInfo(bno);
	}

	@Override
	public Map<String ,Object> th_fileDownLoad(int bno) throws Exception{
		return commonDAO.th_fileDownLoad(bno);
	}

}



