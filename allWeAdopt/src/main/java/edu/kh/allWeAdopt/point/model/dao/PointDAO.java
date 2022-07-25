package edu.kh.allWeAdopt.point.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PointDAO {

	@Autowired  
	private SqlSessionTemplate sqlSession;
	
	//성공한 회원의 포인트를 증가
	public int wordleSuccess(int memberNo) {
		return sqlSession.update("pointMapper.wordleSuccess",memberNo);
	}

	public int rouletteRun(Map<String, Object> map) {
		return sqlSession.update("pointMapper.wordleSuccess",map);
	}

	
}
