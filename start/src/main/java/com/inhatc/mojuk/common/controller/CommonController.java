package com.inhatc.mojuk.common.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.inhatc.mojuk.common.service.CommonService;

	@Controller
	public class CommonController {
	    Logger log = Logger.getLogger(this.getClass());
	    String filePath = "C:\\dev\\mojuk\\files\\"; 
	    String my_filePath = "C:\\dev\\mojuk\\files\\";
	    
	    @Autowired
	    private CommonService commonService;
	    
	    
	    @RequestMapping(value="/common/downloadFile.do", method = RequestMethod.POST)
	    public void downloadFile(@RequestParam("IDX") int bno,@RequestParam(value="TYPE", defaultValue="null") String type, HttpServletResponse response) throws Exception{
	    	log.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>         다운로드 컨트롤러 진입          <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");

	        Map<String,Object> map = null;
	        if(type.equals("th")) {
	        	filePath = my_filePath;
	        	map = commonService.th_fileDownLoad(bno);
	        }else {
	        	map= commonService.selectFileInfo(bno);
	        }
	        
	        log.info(filePath);
	        String storedFileName = (String)map.get("STORED_FILE_NAME");
	        String originalFileName = (String)map.get("ORIGINAL_FILE_NAME");
	        
	        byte fileByte[] = FileUtils.readFileToByteArray(new File( filePath +storedFileName));
	        
	        response.setContentType("application/octet-stream");
	        response.setContentLength(fileByte.length);
	        response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName,"UTF-8")+"\";");
	        response.setHeader("Content-Transfer-Encoding", "binary");
	        response.getOutputStream().write(fileByte);
	         
	        response.getOutputStream().flush();
	        response.getOutputStream().close();
	        
	    }

}



