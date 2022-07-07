package edu.kh.allWeAdopt.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.allWeAdopt.member.model.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO dao;

	// 이메일 중복검사 구현
	@Override
	public int emailDupCheck( String memberEmail ) {
		
		return dao.emailDupCheck( memberEmail );
	}
	
	

}
