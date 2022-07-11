package edu.kh.allWeAdopt.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import edu.kh.allWeAdopt.board.model.vo.Board;

public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 공지사항 목록 조회 DAO
	 * @param cp
	 * @return
	 */
	public List<Board> selectNoticeList(int cp) {
		
		return null;
	}

}
