package edu.kh.allWeAdopt.member.model.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import edu.kh.allWeAdopt.common.Util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.allWeAdopt.member.model.dao.MemberDAO;
import edu.kh.allWeAdopt.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	

	private Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	
	
	
	// 로그인 Service 구현
	@Override
	public Member login(Member inputMember) {
		
		// *** 암호화 확인용!!! ****
		// 원래 비밀번호(평문)      /       암호화된 비밀번호
  	    logger.debug( inputMember.getMemberPw() + " / " +  bcrypt.encode(inputMember.getMemberPw()) ); 
		
		Member loginMember = dao.login(inputMember);
		
		
		if(loginMember != null) { // 일치하는 이메일을 가진 회원 정보가 있을 경우
					
//			// 입력된 비밀번호(평문) , 조회된 비밀번호(암호화) 비교 (같으면 true)
//							 		//평문                  ,   암호화
			if( bcrypt.matches(  inputMember.getMemberPw()   ,  loginMember.getMemberPw() ) ) {
//				// 비밀번호가 일치할 경우
//				
				loginMember.setMemberPw(null); // 비교 끝났으면 비밀번호 지우기
//				
			} else { // 비밀번호가 일치하지 않은 경우
			
				loginMember = null; // 로그인을 실패한 형태로 바꿔줌
			}
			
		}
		
		
		
		return loginMember;
	}
	
	
	
	
	
	// 이메일 중복검사 구현
	@Override
	public int emailDupCheck( String memberEmail ) {
		
		Member mem = dao.emailDupCheck( memberEmail );
		
		int result = 0;
		// mem이 null이 아닐 때 => 가입된 이력 있음
		if(mem != null) {
			
			
			if(mem.getMemberType().equals("M") || mem.getMemberType().equals("A")) {
				result = 1; // 사이트 가입 회원
			}
			
			if(mem.getMemberType().equals("K")) {
				result =  2; // 카카오 가입 회원
			}
			
		}else {
			// mem이 null일 때
			result = 0; // 중복 없음
		}
		System.out.println(result);
		return result;
		
	}




	// 회원가입 구현
	@Override
	public int signUp(Map<String, Object> map, MultipartFile uploadImage) throws IOException{
		
		// 비밀번호 암호화해서 map에 세팅
		Member member = (Member)map.get("member");
		
		logger.debug("암호화 전 : " + member.getMemberPw());
		
		member.setMemberPw( bcrypt.encode(member.getMemberPw()));
		
		logger.debug("암호화 후 : " + member.getMemberPw());
		
		map.put("member", member);
		
		System.out.println((Member)map.get("member"));
		
			
		String rename = null;
		// 이미지가 업로드 된 경우 Util클래스를 이용해 파일명 rename하기
		if( !uploadImage.isEmpty() ) {
			rename = Util.fileRename( uploadImage.getOriginalFilename() );
			map.put("profileImage", map.get("webPath") + rename);
		}else {
			map.put("profileImage", null);
		}
		
		int result = dao.signUp( map );
		
		// 회원가입 성공 및 profileImage가 null이 아닌경우 파일을 서버에 저장하기!
		if(result > 0 && map.get("profileImage")!=null ) {
					
			uploadImage.transferTo( new File ( map.get("folderPath")+rename) );
		}
		
		return result;
		
	}




	// 카카오 아이디(이메일) 일치하는 회원 정보를 조회하는 Service 호출 후 결과 반환 받기 
	@Override
	public Member kakaoEmailCheck(String kakaoEmail) {
		
		Member kakaoEmailCheck = dao.kakaoEmailCheck(kakaoEmail);
		
		return kakaoEmailCheck;
	}




	// 카카오 회원 넘버 '삽입' 
	@Override
	public int insertNo(Member mem) {
		// DAO 호출
		int result = dao.insertNo(mem);
		
		return result;
	}




	// 이미 로그인 해봤던 카카오계정로그인....
	@Override
	public Member kakaoEmailLogin(Member mem) {
		
		Member kakaoEmailLogin = dao.kakaoEmailLogin(mem);
		
		return kakaoEmailLogin;
	}





	
	
	//채팅대상 정보조회를 위한  Service
	@Override
	public Member selectThisMember(int memberNo) {
		return dao.selectThisMember(memberNo);
	}



	
	


	// 인증번호를 받은 이메일, 인증번호, 인증번호 발급 시간  -> DB 삽입
	@Override
	public int insertCertification(Map<String, Object> map) {
		
		// 1) 입력한 이메일과 일치하는 값이 있는가?
		int result = dao.searchCertification(map);
		
		if( result > 0 ) { // 처음으로 인증번호를 발급.
			
			result = dao.updateCertification(map);
			
		} else {
			
			result = dao.insertCertification(map);
		}
		
		
		return result;
	}

	
	
	
	//이메일 인증번호 체크
	@Override
	public int CheckNumber(Map<String, Object> map) {
		
		
		
		return dao.CheckNumber(map);
	}




	//비밀번호 재설정
	@Override
	public int changePw(Map<String, Object> map) {
		
		// 1) 이메일로 회원조회
		
		// 2)일치하는 회원 비밀번호 재설정(update) 
		
		map.put("newPw",  bcrypt.encode( (String)map.get("newPw") )  );
		// Map에 이미 같은 key가 존재하면
		// value만 덮어씌움

		return dao.changePw(map);
	}
	
	
	

	

	

	
	
	

}
