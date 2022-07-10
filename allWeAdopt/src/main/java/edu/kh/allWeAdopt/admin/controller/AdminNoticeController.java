package edu.kh.allWeAdopt.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/admin/notice")
@SessionAttributes({"loginMember"})
public class AdminNoticeController {

	@GetMapping("/list")
	public String adminNoticeList() {
		
		return "notice/noticeList";
	}
	
	@GetMapping("/detail")
	public String adminNoticeDetail() {
		
		return "notice/noticeDetail";
	}
	
	@GetMapping("/write")
	public String adminNoticeWrite() {
		
		return "notice/noticeWrite";
	}
	
	
	
}
