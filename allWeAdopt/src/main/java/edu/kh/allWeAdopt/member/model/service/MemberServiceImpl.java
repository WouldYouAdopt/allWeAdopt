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
		
		
		
		return loginMember;
	}
	
	
	
	
	
	// 이메일 중복검사 구현
	@Override
	public int emailDupCheck( String memberEmail ) {
		
		return dao.emailDupCheck( memberEmail );
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
		
		
		// 이미지 업로드 여부 확인 1 == 이미지 X / 0 == 이미지 O
		String deleteImage = (String)map.get("deleteImage");
		
		String rename = null;
		// 이미지 업로드 된 경우 Util클래스를 이용해 파일명 rename하기
		if(deleteImage.equals("0")) {
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




	// 카카오로그인 회원정보 조회
	@Override
	public int kakaoLogin(HashMap<String, Object> userInfo) {
		
		//userInfo 의 값을 꺼내서 매개변수로 들고가나??
		
		int result = dao.kakaoLogin(userInfo);
		
		// result == 0 == 일치하는 회원 정보가 없다.
		if ( result == 0 ) {
			
			// insert 작업 진행 
			result = dao.insertMember( userInfo );
			
		}
		
		return result;
		
	}
	






	

	
	
	

}
