package edu.kh.allWeAdopt.notice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.allWeAdopt.notice.model.service.NoticeService;

@Controller
@RequestMapping("/admin/notice")
@SessionAttributes({"loginMember"})
public class AdminNoticeController {
	
	@Autowired
	private NoticeService service;
	
	private Logger logger = LoggerFactory.getLogger(AdminNoticeController.class);

	// 관리자 - 공지사항 리스트 조회화면
	@GetMapping("/list")
	public String adminNoticeList() {
		
		logger.info("공지사항 리스트 조회 수행됨");
		
		return "notice/noticeList";
	}
	
	// 관리자 - 공지사항 상세조회화면
	@GetMapping("/detail")
	public String adminNoticeDetail() {
		
		return "notice/noticeDetail";
	}
	
	// 관리자 - 공지사항 작성화면
	@GetMapping("/write")
	public String adminNoticeWrite() {
		
		return "notice/noticeWrite";
	}
	
}
