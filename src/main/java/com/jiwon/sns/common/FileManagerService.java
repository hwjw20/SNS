package com.jiwon.sns.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {

	public static final String FILE_UPLOAD_PATH = "D:\\황지원\\SpringProject\\upload\\images";
	
	private static Logger logger = LoggerFactory.getLogger(FileManagerService.class);
	
	public static String saveFile(int userId, MultipartFile file) {
		
		String directoryName = "/" + userId + "_" + System.currentTimeMillis() + "/";
		
		// 디렉토리 생성
		String directoryPath = FILE_UPLOAD_PATH + directoryName;
		File directory = new File(directoryPath);
		if(directory.mkdir() == false) {
			//디렉토리 생성 실패
			// 디렉토리 생성 실패 로그 추가
			logger.error("savefile : 디렉토리 생성 실패" + directoryPath);
			return null;
		}
		
		// 파일 저장
		String filePath = null;
		try {
			byte[] bytes = file.getBytes();
			
			filePath = directoryPath + file.getOriginalFilename();
			Path path = Paths.get(filePath);
			Files.write(path, bytes);
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
			logger.error("savefile : 파일 생성 에러 - " + filePath);
			
			return null;
		}
		
		return "/images" + directoryName + file.getOriginalFilename();
	}
}
