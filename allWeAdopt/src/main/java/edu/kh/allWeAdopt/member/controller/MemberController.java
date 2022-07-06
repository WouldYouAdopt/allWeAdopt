package edu.kh.allWeAdopt.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	// 회원가입 페이지
	@GetMapping("/signUp")
	public String signUp() {
		
		return "member/signUp";
	}

}
