package edu.kh.allWeAdopt.member.model.dao;

import java.util.HashMap;
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
	public int emailDupCheck(String memberEmail) {
		
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




	/** 카카오로그인 회원정보 조회
	 * @param userInfo
	 * @return
	 */
	public int kakaoLogin(Map<String, Object> userInfo) {
		
		int result = sqlSession.selectOne("memberMapper.kakaoLogin", userInfo);
		
		
		return result;
	}




	/** 카카오 로그인 회원 회원넘버 주기
	 * @param userInfo
	 * @return
	 */
	public int insertMember(HashMap<String, Object> userInfo) {
		
		return sqlSession.insert("memberMapper.insertMember", userInfo);
	}
	
	
	
	
	
	
	

}
