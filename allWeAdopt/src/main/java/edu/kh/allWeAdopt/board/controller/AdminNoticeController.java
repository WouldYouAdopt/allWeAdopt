package edu.kh.allWeAdopt.board.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.allWeAdopt.board.model.service.NoticeService;

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
		model.addAttribute(map);
		
		return "notice/noticeList";
	}
	
	// 관리자 - 공지사항 상세조회화면
	@GetMapping("/notice/detail")
	public String adminNoticeDetail() {
		
		return "notice/noticeDetail";
	}
	
	// 관리자 - 공지사항 작성화면
	@GetMapping("/notice/write")
	public String adminNoticeWrite() {
		
		return "notice/noticeWrite";
	}

}
