package edu.kh.allWeAdopt.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** DB에 저장된 boardContent 조회 DAO
	 * @return
	 */
	public List<String> selectDBList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.selectDBList");
	}

}
