package edu.kh.allWeAdopt.point.model.service;

import java.util.HashMap;
import java.util.Map;

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

	/**룰렛 후 수행 결과로 변환하는 service 구현
	 *
	 */
	@Override
	public int rouletteRun(int total, int memberNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total",total);
		map.put("memberNo", memberNo);
		return dao.rouletteRun(map);
	}

	
	
	
}
