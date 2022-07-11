package edu.kh.allWeAdopt.board.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.allWeAdopt.board.model.dao.NoticeDAO;
import edu.kh.allWeAdopt.board.model.vo.Board;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	// 공지사항 목록 조회 구현
	@Override
	public List<Board> selectNoticeList(int cp) {
		
		return dao.selectNoticeList(cp);
	}	


}
