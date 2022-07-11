package edu.kh.allWeAdopt.member.model.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.allWeAdopt.member.model.vo.Member;

public interface MemberService {

	
	
	/** 로그인 서비스
	 * @param inputMember
	 * @return loginMember
	 */
	public abstract Member login(Member inputMember);

	

	 
	/** 이메일 중복검사 Service
	 * @return result
	 */
	int emailDupCheck( String memberEmail );




	/** 회원가입 Service
	 * @param map
	 * @return result
	 * @throws IOException
	 */
	public int signUp(Map<String, Object> map, MultipartFile uploadImage) throws IOException;




	/** 카카오 아이디(이메일) 일치하는 회원 정보를 조회하는 Service 호출 후 결과 반환 받기 
	 * @param kakaoEmail
	 * @return
	 */
	public abstract Member kakaoEmailCheck(String kakaoEmail);




	/** 카카오 회원 넘버 '삽입' 
	 * @param kakaoEmail
	 * @param nickname
	 * @return result
	 */
	public abstract int insertNo(Member mem);







	
	
	
	
	
	
	





}
