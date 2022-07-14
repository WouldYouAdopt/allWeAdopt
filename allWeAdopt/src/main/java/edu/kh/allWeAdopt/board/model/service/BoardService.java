package edu.kh.allWeAdopt.board.model.service;

import java.util.List;

public interface BoardService {

	/** DB에 저장된 boardContent 조회 Service
	 * @return dbList
	 */
	List<String> selectDBList();

}
