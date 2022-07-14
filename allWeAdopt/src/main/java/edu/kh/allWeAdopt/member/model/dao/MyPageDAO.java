package edu.kh.allWeAdopt.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.allWeAdopt.member.model.vo.Member;

@Repository
public class MyPageDAO {
	
	@Autowired  
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(MemberDAO.class);

	/** 내정보 수정 전 - 비밀번호 확인 DAO
	 * @param loginMember
	 * @return result
	 */
	public int pwConfirm(Member loginMember) {
		
		return  sqlSession.selectOne("myPageMapper.pwConfirm", loginMember );
	}

	/** 나의 정보 수정 DAO
	 * @param map
	 * @return result
	 */
	public int updateInfo(Map<String, Object> map) {

		return sqlSession.update("myPageMapper.updateInfo", map);
	}

	/** 현재 비밀번호 조회 DAO
	 * @param map
	 * @return memberPw
	 */
	public String selectMemberPw(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("myPageMapper.selectMemberPw", map);
	}


	/** 비밀번호 변경 DAO
	 * @param map
	 * @return
	 */
	public int updatePw(Map<String, Object> map) {
		
		return sqlSession.update("myPageMapper.updatePw", map);
	}

	/** 현재 로그인한 회원의 암호화된 비밀번호 조회 DAO
	 * @param memberNo
	 * @return encPw
	 */
	public String selectEncPw(int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectEncPw", memberNo);	
	}

	/** 회원 탈퇴 DAO
	 * @param memberNo
	 * @return result
	 */
	public int secession(int memberNo) {
		return sqlSession.update("myPageMapper.secession", memberNo);
	}

	

	
	
	

}
