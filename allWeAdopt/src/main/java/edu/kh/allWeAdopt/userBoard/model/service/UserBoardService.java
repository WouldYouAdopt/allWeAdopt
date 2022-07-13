package edu.kh.allWeAdopt.userBoard.model.service;

import edu.kh.allWeAdopt.board.model.vo.Board;
import edu.kh.allWeAdopt.userBoard.model.vo.Animal;
import edu.kh.allWeAdopt.userBoard.model.vo.Area;

public interface UserBoardService {

	int userBoardRegist(Board board);

	int getBoardNo();

	int userBoardArea(Area area);

	int userBoardAnimal(Animal animal);

}
