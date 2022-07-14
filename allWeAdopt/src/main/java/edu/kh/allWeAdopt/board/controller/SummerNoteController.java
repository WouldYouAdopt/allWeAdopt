package edu.kh.allWeAdopt.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import edu.kh.allWeAdopt.common.Util;

@Controller
@RequestMapping("/summerNote")
public class SummerNoteController {
	
	// summerNote 이미지 업로드
	@PostMapping("/uploadImage")
	@ResponseBody
	public String insertImage( @RequestParam(value="uploadFile", required=false) MultipartFile image,
							   HttpServletRequest req ) throws IOException{
		
		// 폴더 경로
		String filePath = "/resources/images/summernote/";
		
		// 실제 경로
		String folderPath = req.getSession().getServletContext().getRealPath(filePath);
		
		String rename = null;
		Map<String,Object> map = new HashMap<String, Object>();
		
		// 업로드한 이미지 파일이 있으면
		if( !image.isEmpty() ) {
			
			// Util 을 이용해 rename하기
			rename = Util.fileRename( image.getOriginalFilename() );
			
			map.put("filePath",filePath);
			map.put("fileName", rename);
			
			// 이미지 서버에 저장
			image.transferTo( new File ( folderPath+rename ) );
			
		}else {
			System.out.println("업로드 이미지 없음 ;;");
		}
		
		return new Gson().toJson(map);
	}

}
