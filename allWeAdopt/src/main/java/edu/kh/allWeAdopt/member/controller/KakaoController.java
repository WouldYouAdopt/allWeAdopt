package edu.kh.allWeAdopt.member.controller;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import edu.kh.allWeAdopt.member.model.service.MemberService;
import edu.kh.allWeAdopt.member.model.vo.Member;

import org.springframework.web.bind.support.SessionStatus;



// 세션 어트리뷰트
@SessionAttributes({"loginMember"})
@Controller
public class KakaoController {
	
	@Autowired
	private MemberService service;
	
	

	@GetMapping("/member/kakaoLogin")
	@ResponseBody
	public String getKakaoAuthUrl(
			HttpServletRequest request) throws Exception {
		String reqUrl = 
				"https://kauth.kakao.com/oauth/authorize"
				+ "?client_id=9f850843147b9b51e1955e311d9dc9ba"
				+ "&redirect_uri=http://localhost:8081/allWeAdopt/member/kakaoLogin2"
				+ "&response_type=code";
		 
		return reqUrl;
	}  
	
	// 카카오 연동정보 조회 -> 카카오 이메일/프로필사진/이름 조회
	@RequestMapping(value = "/member/kakaoLogin2")
	public String oauthKakao( @RequestParam(value = "code", required = false) String code
							, Model model
							/*, RedirectAttributes ra*/) throws Exception {
		
		String message = null;

		// 카카오에서 제공하는 토큰가지고 조회를 하는거
		System.out.println("#########" + code);
		String access_Token = getAccessToken(code);
		System.out.println("###access_Token#### : " + access_Token);


		HashMap<String, Object> userInfo = getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###userInfo#### : " + userInfo.get("email"));
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###profileImage#### : " + userInfo.get("profileImage"));



        
        // 1. 해당 이메일에 비밀번호가 있는가?
        // 2. --> 있다면, 이미 사이트에서 가입한 이력이 있음.
        //        --> 사이트에 가입한 이메일로 가입하시오. 
        // 3. --> 없다면, sns로그인한 사람이니까.
        //        --> 회원테이블에 일치하는 이메일이 있는지 확인!
        // 4. 일치하는 회원이 있다면,
        //    --> else 로 그냥 로그인 고
        // 5. 일치하는 회원이 없다면, 
        //    --> 회원 넘버 삽입 
        
        if ( userInfo != null ) {
        	
        	String kakaoEmail = (String) userInfo.get("email");
        	String nickname = (String)userInfo.get("nickname");
        	String profileImage = (String)userInfo.get("profileImage");

        	System.out.println(kakaoEmail);
        	System.out.println(nickname);
        	
        	// 카카오 아이디(이메일) 일치하는 회원 정보를 조회하는 Service 호출 후 결과 반환 받기 
        	Member kakaoEmailCheck = service.kakaoEmailCheck(kakaoEmail);
        	
        	if(kakaoEmailCheck!=null) {
	        	
        		if( kakaoEmailCheck.getMemberPw() != null ) { 
        		
        			// 너는 사이트로 횐갑했으니까 사이트로그인에서 해라.
        			message = "올 위 어답터로 회원가입한 회원입니다.";
        			return "redirect:/member/login"; // 회원 로그인 페이지
        			
	        	}else {
	        		
	        		kakaoEmailCheck.setProfileImage(profileImage);
	        		kakaoEmailCheck.setMemberName(nickname);
	        		
	        		
	        		
	                //회원 정보 JSON 형태로 저장
	        		kakaoEmailCheck.setMemberJson(new Gson().toJson(kakaoEmailCheck));

	        		
	        		
	        		
	        		// 카카오 로그인 했었던 사람 
	        		 model.addAttribute("loginMember", kakaoEmailCheck);
	        	      
	        	     return "redirect:/"; //본인 원하는 경로 설정
	        		
	        	}
        	
        		
        		
        	}else {
        		
        		// 카카오 이메일, 이름, 프로필이미지(왜 null이지?) 회원테이블에 삽입 == 회원번호 삽입
        		Member mem = new Member();
        		mem.setMemberEmail(kakaoEmail);
        		mem.setMemberName(nickname);
        		mem.setProfileImage(profileImage);
        		
        		// 카카오 회원넘버 '삽입' 서비스 호출.
        		int result = service.insertNo(mem);
        		
        		
        		
        		if(result > 0) { //  성공
        			
        			
        			//회원 정보 JSON 형태로 저장
        			mem.setMemberJson(new Gson().toJson(mem));
        			
        			
        			
        			model.addAttribute("loginMember", mem);
        			message = "카카오 로그인 성공!!";
        			return  "redirect:/"; // 메인페이지
        			
        		}else { // 실패
        			message = "로그인 실패ㅠㅠ";
        			return "redirect:/member/login"; // 회원 로그인 페이지
        		
        		}
        		
        	}
        	
        }
//      JSONObject kakaoInfo =  new JSONObject(userInfo);
//        model.addAttribute("kakaoInfo", userInfo);
      
        return "redirect:/"; //본인 원하는 경로 설정
      
	}
			
		
    //토큰발급
	public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //  URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //	POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=9f850843147b9b51e1955e311d9dc9ba");  //본인이 발급받은 key
            sb.append("&redirect_uri=http://localhost:8081/allWeAdopt/member/kakaoLogin2"); // 본인이 설정해 놓은 경로
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return access_Token;
    }
	
    //유저정보조회
    public HashMap<String, Object> getUserInfo (String access_Token) {

        //요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            String profileImage = properties.getAsJsonObject().get("profile_image").getAsString();
            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();
            
            System.out.println(profileImage);
            
            userInfo.put("accessToken", access_Token);
            userInfo.put("nickname", nickname);
            userInfo.put("email", email);
            userInfo.put("profileImage", profileImage);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return userInfo;
    }
    

    
    
	// 카카오 로그아웃
	@GetMapping("/logout")
	public String logout(SessionStatus status,
						HttpSession session) {
		
		session.removeAttribute("accessToken");
		
		status.setComplete();
		
		return "redirect:/";
	}

    
 
    
    
    
 }