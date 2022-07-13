package edu.kh.allWeAdopt.shelter.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.allWeAdopt.shelter.model.vo.ShelterReply;

@Repository
public class ShelterReplyDAO {

	@Autowired  
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(ShelterReplyDAO.class);

	
	/** 댓글 목록 조회
	 * @param desertionNo
	 * @return
	 */
	public List<ShelterReply> selectReplyList(String desertionNo) {
		return sqlSession.selectList("shelterMapper.selectReplyList", desertionNo);
	}
	
}
