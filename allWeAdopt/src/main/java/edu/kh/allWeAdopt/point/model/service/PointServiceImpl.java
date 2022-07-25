package edu.kh.allWeAdopt.point.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.allWeAdopt.point.model.dao.PointDAO;

@Service
public class PointServiceImpl implements PointService{

	@Autowired
	private PointDAO dao;
	
	/**성공한 회원의 포인트를 증가시켜주는 service 구현
	 *
	 */
	@Override
	public int wordleSuccess(int memberNo) {
		return dao.wordleSuccess(memberNo);
	}

	
	
}
