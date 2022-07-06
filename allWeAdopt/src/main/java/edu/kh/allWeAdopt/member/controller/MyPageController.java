package edu.kh.allWeAdopt.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/myPage")
public class MyPageController {
	
	// 내정보 수정 전 비밀번호 확인 페이지
	@GetMapping("/pwConfirm")
	public String pwConfirm() {
		
		return "member/myPage-pwConfirm";
	}
	
	// 내정보 수정 페이지
	@GetMapping("/updateInfo")
	public String updateInfo() {
		
		return "member/myPage-updateInfo";
	}

}
