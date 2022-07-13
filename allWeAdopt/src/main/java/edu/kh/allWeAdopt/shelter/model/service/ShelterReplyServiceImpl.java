package edu.kh.allWeAdopt.shelter.model.service;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.allWeAdopt.shelter.model.dao.ShelterReplyDAO;
import edu.kh.allWeAdopt.shelter.model.vo.ShelterReply;

@Service
public class ShelterReplyServiceImpl implements ShelterReplyService{

	@Autowired
	private ShelterReplyDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(ShelterReplyServiceImpl.class);

	
	// 댓글 목록 조회
	@Override
	public List<ShelterReply> selectReplyList(String desertionNo) {
		return dao.selectReplyList(desertionNo);
	}

	

	
	
	
	
}
