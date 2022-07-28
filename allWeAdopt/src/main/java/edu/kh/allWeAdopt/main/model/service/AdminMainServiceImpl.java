package edu.kh.allWeAdopt.main.model.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.kh.allWeAdopt.member.model.dao.MemberDAO;
import edu.kh.allWeAdopt.member.model.service.MemberServiceImpl;

@Service
public class AdminMainServiceImpl implements AdminMainService{
	
	@Autowired
	private MemberDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	@Override
	public Map<String, Object> selectList() {

		// 문의글 갯수 조회(오늘 날짜 조회) 
		// 어답터게시글 갯수 조회(오늘 날짜 조회)
		// 오늘 펀딩 결제 목록 갯수 조회(오늘 날짜조회)
		
		
		// 어답터 게시글 추이(리스트)
		
		// 펀딩 주문 추이(리스트) 
				
		
		
		return null;
	}
	
	
	
	
}
