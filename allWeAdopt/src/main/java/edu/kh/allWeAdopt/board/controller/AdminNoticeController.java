package edu.kh.allWeAdopt.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import edu.kh.allWeAdopt.board.model.service.NoticeService;
import edu.kh.allWeAdopt.board.model.vo.BoardDetail;
import edu.kh.allWeAdopt.board.model.vo.Image;
import edu.kh.allWeAdopt.common.Util;

@Controller
@RequestMapping("/admin")
@SessionAttributes({"loginMember"})
public class AdminNoticeController {
	
	@Autowired
	private NoticeService service;
	
	private Logger logger = LoggerFactory.getLogger(AdminNoticeController.class);

	// 관리자 - 공지사항 리스트 조회화면
	@GetMapping("/notice/list")
	public String adminNoticeList( @RequestParam(value="cp", required=false, defaultValue="1") int cp,
								   Model model) {
		
		logger.info("공지사항 리스트 조회 수행됨");
		
		// nList를 조회하는 서비스 호출 ~
		Map<String, Object> map = service.selectNoticeList(cp);
		
		// request범위에 nList 세팅
		model.addAttribute("map", map);
		
		return "notice/noticeList";
	}
	
	// 관리자 - 공지사항 상세조회화면
	@GetMapping("/notice/detail/{boardNo}")
	public String adminNoticeDetail( @PathVariable("boardNo") int boardNo,
								 	 @RequestParam(value="cp", required=false, defaultValue="1") int cp,
								 	 Model model ) {
		
		BoardDetail detail = service.selectNoticeDetail(boardNo); 
		
		model.addAttribute("detail",detail);
		
		return "notice/noticeDetail";
	}
	
	// 관리자 - 공지사항 작성화면
	@GetMapping("/notice/write")
	public String adminNoticeWrite() {
		
		return "notice/noticeWrite";
	}
	
	// 관리자 - 공지사항 작성
	@PostMapping("/notice/write")
	public String adminNoticeWrite( BoardDetail detail,
									Model model,
									RedirectAttributes ra) {
		
		logger.info("글 등록 수행됨");
		System.out.println(detail);
		
		int result = service.insertBoard(detail);
		
		if(result>0) {
			ra.addFlashAttribute( "message", "게시글 등록 성공" );
			model.addAttribute("detail",detail);
			return "redirect:detail/"+detail.getBoardNo();
			
		}else {
			ra.addFlashAttribute( "message", "게시글 등록 실패" );
			return "redirect:write";
		}
		
	}
	
	// 관리자 - summerNote 이미지 업로드
	@PostMapping("/insertImage")
	@ResponseBody
	public String insertImage( @RequestParam(value="uploadFile", required=false) MultipartFile image,
							   HttpServletRequest req ) throws IOException{
		
		// 폴더 경로
		String filePath = "/resources/images/board/";
		
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
