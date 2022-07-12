package edu.kh.allWeAdopt.userBoard.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.allWeAdopt.board.model.vo.Board;
import edu.kh.allWeAdopt.userBoard.model.vo.Animal;
import edu.kh.allWeAdopt.userBoard.model.vo.Area;

@Repository
public class UserBoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

//	게시글 등록
	public int userBoardRegist(Board board) {
		return sqlSession.insert("boardMapper.userBoardRegist",board);
	}

	public int getBoardNo() {
		return sqlSession.selectOne("boardMapper.getBoardNo");
	}
	
	public int userBoardArea(Area area) {
		return sqlSession.insert("boardMapper.userBoardArea",area);
	}
	
	public int userBoardAnimal(Animal animal) {
		return sqlSession.insert("boardMapper.userBoardAnimal",animal);
	}




}
