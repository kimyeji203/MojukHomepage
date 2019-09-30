/*package com.inhatc.mojuk.gallery.controller;

import java.io.File;
import java.io.FileInputStream;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.inhatc.mojuk.core.util.MediaUtils;
import com.inhatc.mojuk.core.util.UploadFileUtils;

@Controller
public class UploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	@RequestMapping(value = "/uploadForm.do", method = RequestMethod.GET)
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
	
		//...'/WEB-INF/views/uploadResult.jsp'�� ������.
		return "uploadResult";
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
	@RequestMapping(value = "/uploadAjax.do", method = RequestMethod.GET)
	public String uploadAjax() {
		
	return "test/test";
	}
	
	
	 * ...544p.
	 * ...@RequestMapping::produces = "text/plain;charset=UTF-8"�� �ѱ�� ����������
	 * ...�����ϱ� ���� ������.
	 
	@ResponseBody
	@RequestMapping(value ="/uploadAjax.do", method=RequestMethod.POST, 
		  			produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file)throws Exception{

		logger.info("uploadAjax called... originalName: " + file.getOriginalFilename());
	
		
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
	 * 
	 * ...566p.
	 * ...�̹��������� ������ ȭ������ ������.
	 * ...http://localhost:8080/z4b/displayFile?fileName=/2016/02/09/0c222f07-489c-4c6f-a3a1-38444134e711_sub2_1_contents5.jpg
	 * ...�Ϲ������� �ٿ�ε��.
	 * ...http://localhost:8080/z4b/displayFile?fileName=/2016/02/09/test.rtf
	 * 
	 
	@ResponseBody
	@RequestMapping("/displayFile.do")
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

	
	 * ...578p.
	 * ...ȭ�鿡�� 'x'�� �����ؼ� ÷�������� �����ϸ�, ���� ���� ��ο����� ������ ������.
	 * ...�̹��������� ���������� ���� �����ϰ�, ���� ����� ������ ������.
	 
	@ResponseBody
	@RequestMapping(value="/deleteFile.do", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){

		logger.info("z4b.delete file: "+ fileName);

		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);

		MediaType mType = MediaUtils.getMediaType(formatName);

		if(mType != null){
			String front = fileName.substring(0,12);
			String end = fileName.substring(14);
			new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
		}

		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}  

	
	 * ...609p.�Խñ� ������ ÷������ ����.
	 * ...������ ÷�������� �Բ� ������.
	 
	@ResponseBody
	@RequestMapping(value="/deleteAllFiles.do", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files){

		logger.info("delete all files: "+ files);
	
		if(files == null || files.length == 0) {
		  return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}
	
		for (String fileName : files) {
		  String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		  
		  MediaType mType = MediaUtils.getMediaType(formatName);
		  
		  if(mType != null){      
			
			String front = fileName.substring(0,12);
			String end = fileName.substring(14);
			new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
		  }
		  
		  new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		  
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	} 	
	

}


*/