package edu.kh.allWeAdopt.main.model.service;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.kh.allWeAdopt.main.model.dao.AdminMainDAO;
import edu.kh.allWeAdopt.main.model.vo.AdminMain;
import edu.kh.allWeAdopt.member.model.service.MemberServiceImpl;

@Service
public class AdminMainServiceImpl implements AdminMainService{
	
	@Autowired
	private AdminMainDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);


	
	
	@Override
	public AdminMain adminMainCount() {
		return  dao.adminMainCount();
	}
	
	
	
	
}
