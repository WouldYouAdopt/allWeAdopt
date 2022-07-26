package edu.kh.allWeAdopt.point.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.allWeAdopt.funding.model.vo.OrderDetail;

@Repository
public class PointDAO {

	@Autowired  
	private SqlSessionTemplate sqlSession;
	
	//성공한 회원의 포인트를 증가 DAO
	public int wordleSuccess(int memberNo) {
		return sqlSession.update("pointMapper.wordleSuccess",memberNo);
	}

	/**룰렛 수행후 해당 유저의 포인트를 수정 DAO
	 * @param map
	 * @return
	 */
	public int rouletteRun(Map<String, Object> map) {
		return sqlSession.update("pointMapper.rouletteRun",map);
	}

	/**결제시 사용한 포인트를 차감하는 DAO
	 * @param memberNo
	 * @param point
	 */
	public int PointDown(int memberNo, int point) {
		Map<String,Object>map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("point",point);
		return sqlSession.update("pointMapper.pointDown",map);
	}

	/**회원이 한 결제중 포인트를 사용한 내역을 조회해 옴
	 * @param memberNo
	 * @return
	 */
	public List<OrderDetail> myPoint(int memberNo) {
		return sqlSession.selectList("pointMapper.myPoint",memberNo);
	}

	public int selectMyPoint(int memberNo) {		
		return sqlSession.selectOne("pointMapper.selectMyPoint",memberNo);
	}

	
}