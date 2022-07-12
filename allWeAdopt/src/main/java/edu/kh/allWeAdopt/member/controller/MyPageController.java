package edu.kh.allWeAdopt.member.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.allWeAdopt.member.model.service.MyPageService;
import edu.kh.allWeAdopt.member.model.vo.Member;


import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.net.ssl.HttpsURLConnection;



@Controller
@RequestMapping("/member/myPage")
@SessionAttributes({"loginMember"})
public class MyPageController {
	
	@Autowired 
	private MyPageService service; 
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// 내정보 수정 전 - 비밀번호 확인 페이지
	@GetMapping("/pwConfirm")
	public String pwConfirm() {
		
		return "member/myPage-pwConfirm";
	}
	
	// 비밀번호 확인 후 내정보 수정 페이지로 전환
	@PostMapping("/updateInfo")
	public String confirmPw ( @ModelAttribute("loginMember") Member loginMember,
			                 String memberPw,
			                 RedirectAttributes ra) {
		
		logger.info("비밀번호 확인 기능 수행됨");

		int result = service.pwConfirm( loginMember );
		
		if(result>0) {
			return "redirect:updateInfo";
		}else {
			ra.addFlashAttribute("message", "비밀번호 불일치");
			return "redirect:pwConfirm";
		}
		
	}
	
	// 나의 정보 관리 페이지
	@GetMapping("updateInfo")
	public String updateInfo() {
		
		return "member/myPage-updateInfo";
	}
	
	// 내정보 수정 진행
	@PostMapping("/updateInfo/{mode}")
	public String updateInfo( @PathVariable("mode") int mode,
							  @ModelAttribute("loginMember") Member loginMember,
							  @RequestParam(value="memberAddress", required=false) String[] memberAddress,
							  @RequestParam(value="uploadImage", required=false) MultipartFile uploadImage,
							  @RequestParam Map<String, Object> map,
							  HttpServletRequest req,
							  RedirectAttributes ra) throws IOException{
		
		
		// 회원번호 세팅
		map.put("memberNo", loginMember.getMemberNo());
		
		// mode1 : 나의 정보 수정
		if(mode==1) {
			
			// 주소에 구분자 ",," 추가
			String newAddr = String.join(",,", memberAddress);
			map.put("newAddr", newAddr);
			
			// 기존 프로필 사진 세팅
			map.put("profileImage", loginMember.getProfileImage());
			
			int result = 0;
			
			// 나의 정보 수정
			
			String webPath = "/resources/images/memberProfile/";
			String folderPath = req.getSession().getServletContext().getRealPath(webPath);
			
			map.put("webPath", webPath );
			map.put("folderPath", folderPath );
			
			result = service.updateInfo(map, uploadImage);
			
			if(result>0 ) {
				
				loginMember.setMemberName( (String)map.get("memberName") );
				loginMember.setMemberTel( (String)map.get("memberTel") );
				loginMember.setMemberAddress(newAddr);
				loginMember.setProfileImage( (String)map.get("profileImage"));
				
				ra.addFlashAttribute("message", "나의 정보 수정 완료! ");
			}else {
				ra.addFlashAttribute("message", "나의 정보 수정 실패 ... ");
			}
			
		}
		
		// mode2: 비밀번호 변경
		if(mode==2) {
			
			// 로그인 bCrypt 완성되면 테스트해보기 ~
			int result = service.updatePw( map );
			
			if(result>0) {
				ra.addFlashAttribute("message", "비밀번호 변경 완료!");
			}else {
				ra.addFlashAttribute("message", "비밀번호 변경 실패 (비밀번호 불일치)");
			}
			
		}
		
		return "redirect:/member/myPage/updateInfo";
	}
	
	
	// 회원 탈퇴
	@GetMapping("/secession")
	public String secession() {
		
		return "member/myPage-secession";
	}
	
	
	// 회원 탈퇴
	@PostMapping("/secession")		
	public String secession(@ModelAttribute("loginMember") Member loginMember
						   , SessionStatus status
						   , HttpServletResponse resp
						   , RedirectAttributes ra) {
		
		System.out.println(loginMember.getMemberNo() );
		System.out.println(loginMember.getMemberPw() );
		System.out.println(loginMember.getMemberType() );
		
//		 회원 탈퇴 서비스 호출
		int result = service.secession(loginMember);
		
		String message = null;
		String path = null;
		
		if(result > 0) {
			message = "탈퇴 되었습니다.";
			path = "/";
			
			// 세션 없애기
			status.setComplete();
			
		}else {
			message = "현재 비밀번호가 일치하지 않습니다.";
			path = "secession";
		}
		
		ra.addFlashAttribute("message", message);
		
		return "redirect:" + path;
	}
		
	
	

	// 리캡챠 
	@ResponseBody
	@PostMapping("/VerifyRecaptcha")
	public int VerifyRecaptcha(HttpServletRequest request) {
	    VerifyRecaptcha.setSecretKey("6LfbI-MgAAAAAEbo8STpY1P5G4yWj3vw5Sr93Q54");
	    String gRecaptchaResponse = request.getParameter("recaptcha");
	    
	    
	    try {
	       if(VerifyRecaptcha.verify(gRecaptchaResponse)) {
	    	   
	    	   
	    	   return 0; // 성공
	    	   
	       } else {
	    	   
	    	   return 1; // 실패
	       }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return -1; //에러
	    }
	}
	
	
	
	
	
	

}
