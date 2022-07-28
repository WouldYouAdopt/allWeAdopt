package edu.kh.allWeAdopt.main.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.allWeAdopt.main.model.vo.AdminMain;
import edu.kh.allWeAdopt.member.model.dao.MemberDAO;

@Repository
public class AdminMainDAO {
	
	@Autowired  
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(AdminMainDAO.class);

	
	
	
	/** 오늘날짜 '문의 글 수 조회' / 오늘날자 어답터 게시글 수 / 오늘날짜 펀딩 결제 건수
	 * @return
	 */
	public AdminMain adminMainCount() {
		
		return sqlSession.selectOne("adminMapper.adminMainCount");
	}


}
