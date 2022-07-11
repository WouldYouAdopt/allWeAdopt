package edu.kh.allWeAdopt.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.allWeAdopt.board.model.dao.NoticeDAO;
import edu.kh.allWeAdopt.board.model.vo.Board;
import edu.kh.allWeAdopt.board.model.vo.Pagination;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	// 공지사항 목록 조회 구현
	@Override
	public Map<String, Object> selectNoticeList(int cp) {
		
		// 1-1. 게시글 수 조회
		int listCount = dao.getListCount();
		
		// 1-2. 페이지네이션 객체 생성
		Pagination pagination = new Pagination(cp, listCount);
		
		// 2. 게시글 목록 조회
		List<Board> nList = dao.selectNoticeList(pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nList", nList);
		map.put("pagination", pagination);
		
		return map;
	}	


}
