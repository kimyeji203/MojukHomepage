/*package com.inhatc.mojuk.gallery.controller;

//...522p.

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.inhatc.mojuk.core.util.MediaUtils;
import com.inhatc.mojuk.core.util.UploadFileUtils;

@Controller
public class GalleryController {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public void uploadForm() {
	}	

	//...524p.
	...528p.�ּ�ó��.
	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
	public void uploadForm(MultipartFile file, Model model) throws Exception {
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());//...������ MIMEŸ�Ե��� ����.
	}
	

	//...527p.
	//...servlet-context.xml�� ������ ���ϰ��.
	@Resource(name = "uploadPath")
	private String uploadPath;
		
	@RequestMapping(value = "/uploadForm.do", method = RequestMethod.POST)
	public String uploadForm(MultipartFile file, Model model) throws Exception {

		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());
	
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
	
		model.addAttribute("savedName", savedName);
	
		return "test/uploadResult";
	}
	
	//...528p.
	private String uploadFile(String originalFilename, byte[] fileData) throws Exception {
		
		//...UUID�� �ߺ����� �ʴ� ������ Ű���� �����Ҷ� �����.
		//...���Ͼ��ε忡�� ������ ����, ������ ��ο� ������ �̸��� ������ ���ε��ϴ� ��.
		//...UUID�� ���� (����)������ ���� �����ؼ� ó���ϸ� �ذ��� �� ����.
		UUID uid = UUID.randomUUID();

		String savedName = uid.toString() + "_" + originalFilename;

		File target = new File(uploadPath, savedName);

		//...���� ����ó���� ���������� �����ϴ� FileCopyUtils�� �̿���.
		//...FileCopyUtils�� import org.springframework.util.FileCopyUtils��Ű���� ������ Ŭ������.
		//...���� �����͸� ���Ϸ� ó���ϰų�, �����ϴ� ���� �۾��� �����ϰ� ���� �� ����.
		//...org.springframework.util.FileCopyUtils��Ű���� �����ڰ� �����ϸ鼭 �ʿ��� ���� ������ 
		//...Ŭ������ ������. 
		FileCopyUtils.copy(fileData, target);

		return savedName;

	}
	
	//...536p.
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.GET)
	public void uploadAjax() {
	}
	
	
	 * ...544p.
	 * ...@RequestMapping::produces = "text/plain;charset=UTF-8"�� �ѱ�� ����������
	 * ...�����ϱ� ���� ������.
	 
	@ResponseBody
	@RequestMapping(value ="/uploadAjax", method=RequestMethod.POST, 
		  			produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file)throws Exception{

		logger.info("originalName: " + file.getOriginalFilename());
	
		
		 * ...544p.
		 * ...HttpStatus.CREATED�� ���ϴ� ���ҽ��� ���������� �����Ǿ��ٴ� �����ڵ���.
		 * ...HttpStatus.OK�� �̿��ص� ������.
		 
		//return new ResponseEntity<>(file.getOriginalFilename(), HttpStatus.CREATED); //...559p.�ּ�ó��.
	    return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, 
	    	                	    file.getOriginalFilename(), 
	    	                	    file.getBytes()), 
	    	          				HttpStatus.CREATED);
	}	
	
	
	 * ...563p.
	 * ...displayFile()�� �Ķ���ͷ� ���������� ���۹ޱ⸦ ���ϴ� �����̸��� ����.
	 * ...������ �̸��� '/��/��/��/���ϸ�'�� ���·� ����.
	 * ...displayFile()�� ��ȯ���� ResponseEntity<byte[]>�̰�, ����� ������ ������
	 * ...�����Ͱ� ��.
	 * ...@ResponseBody�� �̿��ؼ� byte[]�����Ͱ� �״�� ���۵� ���� �����.
	 
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]>  displayFile(String fileName)throws Exception{

		InputStream in = null; 	
		ResponseEntity<byte[]> entity = null;

		logger.info("FILE NAME: " + fileName);

		try{
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
	
			//...565p.�����̸����� Ȯ���ڸ� �����ϰ�, �̹��� Ÿ���� ������ ���
			//...������ MIMEŸ���� ������.
			//...�������� �� MIMEŸ���� ���� ����ڿ��� �ڵ����� �ٿ�ε� â�� ������.			
			MediaType mType = MediaUtils.getMediaType(formatName);
	
			HttpHeaders headers = new HttpHeaders();
	
			in = new FileInputStream(uploadPath+fileName);
	
			if(mType != null){
				headers.setContentType(mType);
				
			}else{		
				fileName = fileName.substring(fileName.indexOf("_")+1);
				
				//...565p.
				//...�̹����� �ƴ� ���, MIMEŸ���� �ٿ�ε� ������ ���Ǵ�
				//...'application/octet-stream'���� ������.
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

				//...565p.
				//...�ٿ�ε� �� �� ����ڿ��� ���̴� ������ �̸��̹Ƿ� �ѱ�ó���� �ؼ� ������.
				//...�ѱ� ������ ���, �ٿ�ε��ϸ� ������ �̸��� ������ ������ ������ �ݵ��
				//...���ڵ� ó���� �� �ʿ䰡 ����.
				headers.add("Content-Disposition", 
							"attachment; filename=\""
							+ new String(fileName.getBytes("UTF-8"), "ISO-8859-1")
							+ "\"");
			}
	
			//...565p.
			//...������ �����͸� �д� �κ��� commons���̺귯���� ����� Ȱ���ؼ�
			//...��� ���Ͽ��� �����͸� �о�� IOUtils.toByteArray()��.
			//...����� 'displayFile?fileName=��/��/��/���ϸ�'�� ȣ���ؼ� Ȯ���� �� ����.
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), 
												headers, 
												HttpStatus.CREATED);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			
		}finally{
			in.close();
			
		}
		
		return entity;    
	}	

}*/