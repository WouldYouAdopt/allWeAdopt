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
import edu.kh.allWeAdopt.board.model.vo.BoardDetail;
import edu.kh.allWeAdopt.board.model.vo.Pagination;

/**
 * @author Computer
 *
 */
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
		
		for(Board n : nList) {
			System.out.println(n.getBoardNo());
			System.out.println(n.getBoardTitle());
		}
		
		map.put("nList", nList);
		map.put("pagination", pagination);
		
		return map;
	}

	// 공지사항 상세 조회 구현
	@Override
	public BoardDetail selectNoticeDetail(int boardNo) {
		
		return dao.selectNoticeDetail(boardNo);
	}

	// 게시글 작성 기능 구현
	@Override
	public int insertBoard(BoardDetail detail) {
		
		return dao.insertBoard(detail);
	}

	// 게시글 수정 기능 구현
	@Override
	public int updateBoard(BoardDetail detail) {
		
		return dao.updateBoard(detail);
	}

	// 게시글 삭제 기능 구현
	@Override
	public int deleteBoard(int boardNo) {
		// TODO Auto-generated method stub
		return dao.deleteBoard(boardNo);
	}	
	
	
	

	

}
