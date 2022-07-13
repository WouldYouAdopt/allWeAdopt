package edu.kh.allWeAdopt.userBoard.model.dao;

import java.util.List;

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

	public List<Area> areaList() {
		List<Area> list =sqlSession.selectList("boardMapper.areaList");
		return list;
	}

//	상세 지역 리스트 호출
	public List<Area> loadAreaList(String area) {
		List<Area> list = sqlSession.selectList("boardMapper.loadAreaList",area);
		return list;
	}

// 사용자 게시글 리스트 호출
	public List<Board> boardList() {
		List<Board> list = sqlSession.selectList("boardMapper.boardList");
		return list;
	}

	// 상세 게시판 호출
	public Board boardDetail(int boardNo) {
		Board board = sqlSession.selectOne("boardMapper.boardDetail",boardNo);
		return board;
	}




}
