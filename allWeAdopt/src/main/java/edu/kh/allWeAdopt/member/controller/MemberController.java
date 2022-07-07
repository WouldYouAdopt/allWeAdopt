package edu.kh.allWeAdopt.member.controller;

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

import edu.kh.allWeAdopt.member.model.service.MemberService;

//@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/member")
public class MemberController {
	
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

	
	// 로그인
//	@PostMapping("/login")
//	public String login( @ModelAttribute Member inputMember 
//						, Model model
//						, RedirectAttributes ra
//						, HttpServletResponse resp 
//						, HttpServletRequest req) {
//		
//
//		// 아이디, 비밀번호가 일치하는 회원 정보를 조회하는 Service 호출 후 결과 반환 받기
//		Member loginMember = service.login(inputMember);
//		
//		// 세션에 로긴정보
//		model.addAllAttributes("loginMember",loginMember);
		
		
		// 인트로 유/무 를 위한 쿠키할 때, 참고 
//		if(loginMember != null) { // 로그인 성공 시
//			model.addAttribute("loginMember", loginMember); // == req.setAttribute("loginMember", loginMember);
//	
//			
//			// 로그인 성공 시 무조건 쿠키 생성
//			// 단, 아이디 저장 체크 여부에 따라서 쿠기의 유지 시간을 조정
//			Cookie cookie = new Cookie("saveId", loginMember.getMemberEmail());
//			
//			if(saveId != null) { // 아이디 저장이 체크 되었을 때
//				
//				cookie.setMaxAge(60 * 60 * 24 * 365); // 초 단위로 지정 (1년)
//				
//			} else { // 체크 되지 않았을 때
//				cookie.setMaxAge(0); // 0초 -> 생성 되자마자 사라짐 == 쿠키 삭제
//			}
//			
//			
//			// 쿠키가 적용될 범위(경로) 지정
//			cookie.setPath(req.getContextPath());
//			
//			// 쿠키를 응답 시 클라이언트에게 전달
//			resp.addCookie(cookie);
//			
//			
//			
//		} else {
//			//model.addAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
//		
//			ra.addFlashAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
//			// -> redirect 시 잠깐 Session scope로 이동후
//			//    redirect가 완료되면 다시 Request scope로 이동
//			
//			// redirect 시에도 request scope로 세팅된 데이터가 유지될 수 있도록 하는 방법을
//			// Spring에서 제공해줌
//			// -> RedirectAttributes 객체  (컨트롤러 매개변수에 작성하면 사용 가능)
//		}
		
		
//		return "redirect:/";
//	}
	
	
	
	
		
		
		
		
		
	
	
	
}
