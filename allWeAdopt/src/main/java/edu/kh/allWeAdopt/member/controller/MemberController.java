package edu.kh.allWeAdopt.member.controller;

import com.google.gson.Gson;
import edu.kh.allWeAdopt.member.model.service.MemberService;
import edu.kh.allWeAdopt.member.model.vo.Member;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;
import java.util.Properties;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/member")
public class MemberController {
	
	private final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
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
		
		if(result>0) {
			ra.addFlashAttribute("message", "회원가입 완료");
		}else {
			ra.addFlashAttribute("message", "회원가입 실패");
		}
		
		return "redirect:/";
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(SessionStatus status, HttpSession session) {
		
		status.setComplete();
		
		
		return "redirect:/";
	}

	
	
	// 로그인 화면 전환
	@GetMapping("/login") 
	public String login() {
		return "member/login";
	}
	
	

	
	// 비밀번호 재설정 화면 전환
	// 마이페이지 컨트롤러에있어야하나?	
	@GetMapping("/changePw") 
	public String changePw() {
		return "member/changePw";
	}	
		
		
	
	// 로그인 하기
	@PostMapping("/login")
	public String login(  @ModelAttribute Member inputMember
					     , RedirectAttributes ra
					     , HttpServletRequest req
					     , HttpServletResponse resp 
					     , Model model) {
		
		     
		Member loginMember = service.login(inputMember);
		
		
		
		
		if( loginMember != null) {
			
			
			//회원 정보 JSON 형태로 저장
			loginMember.setMemberJson(new Gson().toJson(loginMember));
			
			model.addAttribute("loginMember", loginMember);
			
			logger.info("로그인 기능 수행됨");
			
			
		} else {
			
			ra.addFlashAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
			
			return "redirect:/member/login"; 
			
		}
		
		
		
		
		return "redirect:/"; 
	}

	
	
	//채팅을 위한 회원 정보 조회용
	@PostMapping("/select/thisUser")
	@ResponseBody
	public String thisUser(int memberNo) {
		Member thisMember = service.selectThisMember(memberNo);
		return new Gson().toJson(thisMember);
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


		String mailContent = // 가변성 문자열 저장 객체
				"<img referrerpolicy=\"no-referrer\" src='https://postfiles.pstatic.net/MjAyMjA3MjlfNzAg/MDAxNjU5MDczOTE4MjY3.QD95sxiFtzYyozQ1HUAvuymx0TI9G-1Bms48XXCaDIcg.XttTAqI9QR9hT-YimkMEdoELwIv_4OlDGFkfTWZdBpQg.PNG.kjy_1615/logo.png?type=w966'>" +
						"      <h3>인증 번호 : <span style='color:black'>" + cNumber + "</span></h3>\n"; // 문자열로 반환
	
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
	

	
	//이메일 인증번호 체크
	@ResponseBody
	@GetMapping("/checkNumber")
	public String CheckNumber(HttpServletRequest req, HttpServletResponse resp, RedirectAttributes ra,
							@RequestParam(value="memberEmail", required=false) String memberEmail,
							@RequestParam(value="cNum", required=false) String cNum,
							 @RequestParam Map<String, Object> map) {
		
		
		map.put("cNum",cNum);
		map.put("memberEmail",memberEmail);
		
		int result = service.CheckNumber(map);
		
		
		return result+"";
	}
	
	
	// 비밀번호 재설정
	@PostMapping("/changePw")
	public String changePw (@RequestParam Map<String, Object> map, RedirectAttributes ra
							) {
		
//		map.put("memberEmail",memberEmail);
//		map.put("memberPw",newPw);
		
		int result = service.changePw(map);
		
		
		if(result>0) {
			ra.addFlashAttribute("message", "비밀번호 변경 완료");
		}else {
			ra.addFlashAttribute("message", "비밀번호 변경 실패");
		}
		
		return "redirect:/";
	}
	
	@GetMapping("/registerAdmin")
	public String requestAdmin() {
		
		return "member/registerAdmin";
	}
	
	@PostMapping("/registerAdmin")
	public String requestAdmin(Member member,
							   RedirectAttributes ra) {
		
		int result = service.registerAdmin ( member );
		
		if(result>0) {
			ra.addFlashAttribute("message", "관리자 계정 등록 완료");
		}else {
			ra.addFlashAttribute("message", "관리자 계정 등록 실패");
		}
		
		return "redirect:registerAdmin";
	}
	
	
}
