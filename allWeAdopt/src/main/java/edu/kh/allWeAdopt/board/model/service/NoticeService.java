package edu.kh.allWeAdopt.board.model.service;

import java.util.List;

import edu.kh.allWeAdopt.board.model.vo.Board;

public interface NoticeService {
	
	/** 공지사항 목록 조회 Service
	 * @param cp
	 * @return nList
	 */
	List<Board> selectNoticeList(int cp);

}
