package edu.kh.allWeAdopt.shelter.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.allWeAdopt.board.model.vo.Board;
import edu.kh.allWeAdopt.board.model.vo.Pagination;

@Repository
public class ShelterDAO {

	@Autowired  
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(ShelterDAO.class);

	/** 전단지 수 조회
	 * @return int
	 */
	public int getListCount() {
		return sqlSession.selectOne("pamphletMapper.getListCount");
	}

	
	/** 전단지 목록 조회
	 * @param pagination
	 * @return
	 */
	public List<Board> selectPamphletList(Pagination pagination) {
		
		int offset = ( pagination.getCurrentPage()-1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("pamphletMapper.selectPamphletList", null, rowBounds);
	}
	
}
