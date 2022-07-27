package edu.kh.allWeAdopt.main.model.service;

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
	
	
}
