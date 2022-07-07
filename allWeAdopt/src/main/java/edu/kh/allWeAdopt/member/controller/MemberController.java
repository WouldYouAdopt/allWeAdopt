package edu.kh.allWeAdopt.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.allWeAdopt.member.model.service.MemberService;
import edu.kh.allWeAdopt.member.model.vo.Member;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/member")
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService service;
	
	// 회원가입 페이지
	@GetMapping("/signUp")
	public String signUp() {
		
		return "member/signUp";
	}
	
	// 이메일 중복 검사
	@GetMapping("/emailDupCheck")
	@ResponseBody
	public int emailDupCheck( String memberEmail ) {
		
		return service.emailDupCheck(memberEmail);
	}

	
	
	// 로그인 화면 전환
	@GetMapping("/login") 
	public String login() {
		return "member/login";
	}
	
	
	// 로그인 하기
	@PostMapping("/login")
	public String login( Member inputMember
					     , RedirectAttributes ra
					     , Model model) {
		
		     
		Member loginMember = service.login(inputMember);
		
		
		
		
		if( loginMember != null) {
			
			model.addAttribute("loginMember", loginMember);
			
			logger.info("로그인 기능 수행됨");
			
		} else {
			
			ra.addFlashAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
			
		}
		
		
		
		
		return "redirect:/"; 
	}
	
	// 비밀번호 재설정 화면 전환
	// 마이페이지 컨트롤러에있어야하나?	
	@GetMapping("/changePw") 
	public String changePw() {
		return "member/changePw";
	}	
		
		
	
	
	
}
