package edu.kh.allWeAdopt.member.model.service;

public interface MemberService {

	/** 이메일 중복검사 Service
	 * @return result
	 */
	int emailDupCheck( String memberEmail );

}
