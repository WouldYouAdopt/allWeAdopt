package edu.kh.allWeAdopt.member.model.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.kh.allWeAdopt.member.model.dao.MemberDAO;
import edu.kh.allWeAdopt.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	

	private Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	
	
	/*
	// 로그인 Service 구현
	@Override
	public Member login(Member inputMember) {
		
		// *** 암호화 확인용!!! ****
		// 원래 비밀번호(평문)      /       암호화된 비밀번호
		logger.debug( inputMember.getMemberPw() + " / " +  bcrypt.encode(inputMember.getMemberPw()) );
		
		Member loginMember = dao.login(inputMember);
		
		
		
		return loginMember;
	}
	*/
	
	
	
	
	// 이메일 중복검사 구현
	@Override
	public int emailDupCheck( String memberEmail ) {
		
		return dao.emailDupCheck( memberEmail );
	}
	
	

}
