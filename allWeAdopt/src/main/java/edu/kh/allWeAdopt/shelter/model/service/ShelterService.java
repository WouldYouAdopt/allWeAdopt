package edu.kh.allWeAdopt.shelter.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.allWeAdopt.board.model.vo.BoardDetail;

public interface ShelterService {
	


	/** 전단지 목록 조회
	 * @param cp
	 * @param boardCode
	 * @return
	 */
	Map<String, Object> selectPamphletList(int cp);

	/** 전단지 상세 조회 
	 * @param boardNo
	 * @return
	 */
	BoardDetail pamphletDetail(int boardNo);

//	BoardDetail selectPamphletUpdate(int boardNo);

	/** 전단지 작성
	 * @param detail
	 * @return
	 */
	int insertPamphlet(BoardDetail detail);

	/** 전단지 수정
	 * @param detail
	 * @return
	 */
	int updatePamphlet(BoardDetail detail);

}
