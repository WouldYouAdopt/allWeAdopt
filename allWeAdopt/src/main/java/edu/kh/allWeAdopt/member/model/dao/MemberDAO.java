package edu.kh.allWeAdopt.member.model.dao;


import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.allWeAdopt.member.model.vo.Member;

@Repository
public class MemberDAO {
	
	@Autowired  
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(MemberDAO.class);
	
	
	/** 로그인 DAO 
	 * @param inputMember
	 * @return loginMember
	 */
	public Member login(Member inputMember) {
		
		Member loginMember = sqlSession.selectOne("memberMapper.login", inputMember);
		
		return loginMember;
	}

	
	

	/** 이메일 중복검사 DAO
	 * @param memberEmail
	 * @return result
	 */
	public Member emailDupCheck(String memberEmail) {
		
		return sqlSession.selectOne("memberMapper.emailDupCheck", memberEmail);
	}




	/** 회원가입 DAO
	 * @param map
	 * @return
	 */
	public int signUp(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.signUp", map);
	}




	/** 카카오 아이디(이메일) 일치하는 회원 정보를 조회하는 Service 호출 후 결과 반환 받기 
	 * @param kakaoEmail
	 * @return kakaoEmailCheck
	 */
	public Member kakaoEmailCheck(String memberEmail) {
		
		Member kakaoEmailCheck = sqlSession.selectOne("memberMapper.kakaoEmailCheck", memberEmail ); 
		
		return kakaoEmailCheck;
	}




	/**  카카오 회원 넘버 '삽입' 
	 * @param kakaoEmail
	 * @param nickname
	 * @return 
	 */
	public int insertNo(Member mem) {
		return sqlSession.insert("memberMapper.insertNo", mem);
	}




	/** 이미 로그인 해봤던 카카오계정로그인....
	 * @param mem
	 * @return
	 */
	public Member kakaoEmailLogin(Member mem) {
		
		Member kakaoEmailLogin = sqlSession.selectOne("memberMapper.kakaoEmailLogin", mem ); 
		
		return kakaoEmailLogin;
	}




	/**채팅 대상 정보 조회를 위한 DAO
	 * @param memberNo
	 * @return
	 */
	public Member selectThisMember(int memberNo) {
		return sqlSession.selectOne("memberMapper.selectThisMember",memberNo);
	}

	

	/** 일치하는 회원조회
	 * @param map
	 * @return result
	 */
	public int searchCertification(Map<String, Object> map) {

		
		return sqlSession.selectOne("memberMapper.searchCertification", map);
	}

	
	/** 처음인 사람에게 인증번호 부여 insert 
	 * @param map
	 * @return result
	 */
	public int insertCertification(Map<String, Object> map) {
		
		return sqlSession.insert("memberMapper.insertCertification", map);	
	}

	
	/** 처음이 아닌 사람에게 인증번호 업데이트
	 * @param map
	 * @return result
	 */
	public int updateCertification(Map<String, Object> map) {
		
		return sqlSession.insert("memberMapper.updateCertification", map);	
	}

	
	/**이메일 인증번호 체크
	 * @param map
	 * @return
	 */
	public int CheckNumber(Map<String, Object> map) {
		return sqlSession.selectOne("memberMapper.CheckNumber", map);
	}




	/** 비밀번호 재설정
	 * @param map
	 * @return 
	 */
	public int changePw(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.changePw", map);
	}




	/** 관리자 계정 등록 DAO
	 * @param member
	 * @return
	 */
	public int registerAdmin(Member member) {
		
		return sqlSession.insert("memberMapper.registerAdmin", member);
	}







	
	
	
	
	
	

}
