package edu.kh.allWeAdopt.member.controller;

import java.io.IOException;
import java.util.Map;
import java.util.Properties;

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
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeMultipart;
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
	
	
	
	
	// 이메일 인증
	@ResponseBody
	@GetMapping("/SendEmail")
	public String SendEmail(HttpServletRequest req, HttpServletResponse resp, RedirectAttributes ra,
							@RequestParam(value="memberEmail", required=false) String inputEmail,
							 @RequestParam Map<String, Object> map) throws IOException, MessagingException{
		
			
			String path = null;
		
			String subject = "[Commnity 프로젝트] 회원 가입 이메일 인증번호"; // 제목
	
			String fromEmail = "allweadopt.email@gmail.com"; // 보내는 사람으로 표시될 이메일 (이메일 따라서 안될수도 있음)
			String fromUsername = "관리자"; // 보내는 사람 이름
			String toEmail = inputEmail; // 받는사람, 콤마(,)로 여러개 나열 가능
	
			// 구글 이메일을 이용한 메일 보내기 (SMTP)
			// 1. 구글 계정 생성(기존 이메일 사용해도됨)
			// 2. 계정 -> 보안 설정 진행  
			//  1) 2단계 인증 추가
			//  2) 앱 비밀번호 생성(메일, 서버컴퓨터 OS) -> 저장해두기 ( dfugrvprjbgeqwra )
	
	
			final String smtpEmail = "allweadopt.email@gmail.com"; // 이메일
			final String password = "smywpahrhkpdhuqq"; // 발급 받은 비밀번호
	
	
			// 메일 옵션 설정
			Properties props = new Properties();
	
			// 중요
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587"); //465, 587
			props.put("mail.smtp.auth", "true");
	
			// 추가 옵션
			props.put("mail.smtp.quitwait", "false");
			props.put("mail.smtp.socketFactory.port", "587");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "true");
			props.put("mail.smtp.starttls.enable", "true");
	
	
				// 메일 세션 생성
				Session session = Session.getDefaultInstance(props);
	
				// 메일 송/수신 옵션 설정(1명 보내기)
				Message message = new MimeMessage(session);
	
				message.setFrom(new InternetAddress(fromEmail, fromUsername)); 	// 송신자(보내는 사람) 지정
	
				message.addRecipient(RecipientType.TO, new InternetAddress(toEmail)); // 수신자(받는사람) 지정
	
				message.setSubject(subject); // 이메일 제목 지정
	
	
	
				// 메일 콘텐츠 설정
				Multipart mParts = new MimeMultipart();
				MimeBodyPart mTextPart = new MimeBodyPart();
	
	
				// 인증번호 6자리 생성코드(영어 대/소문 + 숫자)
				String cNumber = "";
				for(int i=0 ; i< 6 ; i++) {
	
					int sel1 = (int)(Math.random() * 3); // 0:숫자 / 1,2:영어
	
					if(sel1 == 0) {
	
						int num = (int)(Math.random() * 10); // 0~9
						cNumber += num;
	
					}else {
	
						char ch = (char)(Math.random() * 26 + 65); // A~Z
	
						int sel2 = (int)(Math.random() * 2); // 0:소문자 / 1:대문자
	
						if(sel2 == 0) {
							ch = (char)(ch + ('a' - 'A')); // 대문자로 변경
						}
	
						cNumber += ch;
					}
	
				}

			
	
				// 메일에 출력할 텍스트
				StringBuffer sb = new StringBuffer(); // 가변성 문자열 저장 객체
				sb.append("<h3>All We Adopt</h3>\n");
				//sb.append("<img src='https://cdn.wikifarmer.com/wp-content/uploads/2022/02/%ED%94%8C%EB%9F%BC%EB%B0%94%EA%B3%A0.jpg'>");
				sb.append("<h3>인증 번호 : <span style='color:red'>"+ cNumber +"</span></h3>\n");
	
	
	
				String mailContent = sb.toString(); // 문자열로 반환
	
				// 메일 콘텐츠 - 내용 , 메일인코딩, "html" 추가 시 HTML 태그가 해석됨
				mTextPart.setText(mailContent, "UTF-8", "html");
				mParts.addBodyPart(mTextPart);
	
	
				// 메일 콘텐츠 지정
				message.setContent(mParts);
	
	
				// MIME 타입 설정 (이메일 내용이 깨질 때 사용)
				/*MailcapCommandMap MailcapCmdMap = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
				MailcapCmdMap.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
				MailcapCmdMap.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
				MailcapCmdMap.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
				MailcapCmdMap.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
				MailcapCmdMap.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
				CommandMap.setDefaultCommandMap(MailcapCmdMap);*/
	
	
				// 메일 발송
				Transport t = session.getTransport("smtp");
				t.connect(smtpEmail, password);
				t.sendMessage(message, message.getAllRecipients());
				t.close();
	
				//										sysdate
				// 인증번호를 받은 이메일, 인증번호, 인증번호 발급 시간  -> DB 삽입
//				int result = new MemberService().insertCertification(inputEmail, cNumber);
				
				map.put("cNumber",cNumber);
				map.put("memberEmail",inputEmail);
				
				int result = service.insertCertification(map);
				
				
				return result+"";
	}
	

	
	

}
