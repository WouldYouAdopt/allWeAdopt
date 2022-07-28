package edu.kh.allWeAdopt.point.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.allWeAdopt.funding.model.vo.OrderDetail;
import edu.kh.allWeAdopt.point.controller.Point;
import edu.kh.allWeAdopt.point.model.dao.PointDAO;
import edu.kh.allWeAdopt.point.vo.Rank;

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

	//포인트로 결제한 기능 구현
	@Override
	public List<OrderDetail> myPoint(int memberNo) {
		return dao.myPoint(memberNo);
	}

	@Override
	public int selectMyPoint(int memberNo) {
		return dao.selectMyPoint(memberNo);
	}

	// 2048 수행 후 500p증정 및 랭킹 등록
	@Override
	public int game2048Success(Rank r) {
		
		// 최고점수 조회
		int result = 0;
		int highScore = dao.selectHighScore();
		
		if(r.getScore()>highScore) {
			// 최고점수이면 업데이트 후 1000p포인트주기 (result = 1)
			result = dao.updateHighScore(r);
			if(result>0) {
				result = dao.game2048Success(r.getMemberNo());
			}
		}else {
			// 최고점수 아니면 500p포인트만 주기 (result = 2)
			result = dao.wordleSuccess(r.getMemberNo());
			if(result>0) {
				result = 2;
			}
		}
		
		return result;
	}
	
	

	
	
	
	
	
	
}
