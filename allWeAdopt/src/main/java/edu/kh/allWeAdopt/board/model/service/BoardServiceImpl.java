package edu.kh.allWeAdopt.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.allWeAdopt.board.model.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDAO dao;

	// DB에 저장된 boardContent 조회
	@Override
	public List<String> selectDBList() {
		
		return dao.selectDBList();
	}
	
	
	
	

}
