package edu.kh.allWeAdopt.board.model.service;

import java.util.Map;


public interface NoticeService {
	
	/** 공지사항 목록 조회 Service
	 * @param cp
	 * @return nList
	 */
	Map<String, Object> selectNoticeList(int cp);

}
