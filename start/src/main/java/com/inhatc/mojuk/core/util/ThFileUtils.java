package com.inhatc.mojuk.core.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Component("thFileUtils")
public class ThFileUtils{
	MultipartHttpServletRequest request;
	
	private static final String filePath = "C:\\dev\\mojuk\\files\\";

	//파일 업로드 + 업로드 된 파일 정보를 List<Map>형으로 만들기 > DB에 추가 할 수 있도록
	public List<Map<String,Object>> parseInsertFileInfo(String boardIdx, HttpServletRequest request) throws Exception{
		//request로 받은 것을 멀티미디어 형태로 변경
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		//파일 이름들 추출
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		
		File file = new File(filePath);
		if(file.exists() == false) { //파일 경로 없을 시 생성
			file.mkdirs();
		}
		
		//iterator형의 배열에 담겨진 이름을 키로 삼아 파일 업로드
		while(iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next()); //파일 객체 생성
			
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file); //파일을 원하는 위치에 저장
				
				//하나의 파일 > Map 디렉토리
				listMap = new HashMap<String, Object>();
				listMap.put("BOARD_IDX", boardIdx);
				listMap.put("ORIGINAL_FILE_NAME", originalFileName);
				listMap.put("STORED_FILE_NAME", storedFileName);
				listMap.put("FILE_SIZE", multipartFile.getSize());
				
				//전체 파일 list에 파일(Map 디렉토리 형) 하나 추가
				list.add(listMap);
			}
		}
		return list; //
	}

	
}
