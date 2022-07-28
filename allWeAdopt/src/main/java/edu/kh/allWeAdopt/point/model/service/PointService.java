package edu.kh.allWeAdopt.point.model.service;

import java.util.List;

import edu.kh.allWeAdopt.funding.model.vo.OrderDetail;
import edu.kh.allWeAdopt.point.vo.Rank;

public interface PointService {

	/**해당 회원의 포인트를 증가시켜주는 Service ( 김현기)
	 * @param memberNo
	 * @return
	 */
	int wordleSuccess(int memberNo);

	/**해당 회원의 소지 포인트를 변경
	 * @param total
	 * @param memberNo
	 * @return
	 */
	int rouletteRun(int total, int memberNo);

	/**포인트로 결제한 내역을 가져오는 Service
	 * @param memberNo
	 * @return
	 */
	List<OrderDetail> myPoint(int memberNo);

	/**내 포인트조회하는 Service
	 * @param memberNo
	 * @return
	 */
	int selectMyPoint(int memberNo);

	/** 2048 성공시 500p부여 + 랭킹 업데이트
	 * @param memberNo
	 * @param score
	 * @return result
	 */
	int game2048Success(Rank r);

}
