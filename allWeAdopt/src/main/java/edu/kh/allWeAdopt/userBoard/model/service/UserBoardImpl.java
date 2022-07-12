package edu.kh.allWeAdopt.userBoard.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.allWeAdopt.board.model.vo.Board;
import edu.kh.allWeAdopt.userBoard.model.dao.UserBoardDAO;
import edu.kh.allWeAdopt.userBoard.model.vo.Animal;
import edu.kh.allWeAdopt.userBoard.model.vo.Area;

@Service
public class UserBoardImpl implements UserBoardService {

	@Autowired
	private UserBoardDAO dao;
	@Override
	public int userBoardRegist(Board board) {
		
		int result = dao.userBoardRegist(board);
		
		return result;
	}
	
	@Override
	public int getBoardNo() {
		return dao.getBoardNo();
	}

	@Override
	public int userBoardArea(Area area) {
		return dao.userBoardArea(area);	
	}

	@Override
	public int userBoardAnimal(Animal animal) {
		return dao.userBoardAnimal(animal);
	}
	
}
