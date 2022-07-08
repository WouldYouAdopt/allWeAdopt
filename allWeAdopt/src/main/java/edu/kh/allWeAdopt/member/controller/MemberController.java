package edu.kh.allWeAdopt.member.controller;

import java.io.IOException;
import java.util.Map;

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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
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
	
	// 회원가입
	@PostMapping("/signUp")
	public String signUp( Member member, // 입력정보 전체
						  String[] memberAddress, // 회원 주소
						  @RequestParam("uploadImage") MultipartFile uploadImage, // 프로필 사진
						  @RequestParam Map<String, Object> map, // 프로필 사진 삭제여부
						  HttpServletRequest req, // 파일 저장 경로 탐색시 사용
						  RedirectAttributes ra) throws IOException{
		
		// 주소에 구분자 ",," 추가
		member.setMemberAddress( String.join(",,", memberAddress));
		
		// 주소 입력이 안 된 경우 (",,,,") null 세팅
		if(member.getMemberAddress().equals(",,,,")) member.setMemberAddress(null);
		
		// 프로필 이미지를 위한 웹 접근경로, 서버 저장경로 선언
		String webPath = "/resources/images/memberProfile/";
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);
		
		// 전부 map에 담기
		map.put("member", member);
		map.put("webPath", webPath );
		map.put("folderPath", folderPath );
		
		logger.info(map.toString());
		
		// 회원가입 서비스 호출
		int result = service.signUp( map, uploadImage );
		
		if(result>0) ra.addFlashAttribute("message", "회원가입 완료");
		else         ra.addFlashAttribute("message", "회원가입 실패");
		
		return "redirect:/";
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		status.setComplete();
		
		return "redirect:/";
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
