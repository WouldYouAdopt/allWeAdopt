package edu.kh.allWeAdopt.member.model.service;

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

}
