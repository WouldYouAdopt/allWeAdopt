package edu.kh.allWeAdopt.shelter.model.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.allWeAdopt.shelter.model.dao.ShelterDAO;

@Service
public class ShelterServiceImpl implements ShelterService {
	
	@Autowired
	private ShelterDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(ShelterServiceImpl.class);
	
}
