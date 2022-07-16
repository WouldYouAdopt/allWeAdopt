package edu.kh.allWeAdopt.funding.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.allWeAdopt.funding.model.vo.Funding;
import edu.kh.allWeAdopt.funding.model.vo.FundingDetail;
import edu.kh.allWeAdopt.funding.model.vo.OrderDetail;
import edu.kh.allWeAdopt.funding.model.vo.Reward;

public interface FundingService {

	
	/** 펀딩 상세 조회 : 수진
	 * @param fundingNo
	 * @return detail
	 */
	FundingDetail selectFundingDetail(int fundingNo);

	/**자신이 참여한 펀딩 목록들을 조회후 페이지네이션과 같이 가져오는 함수 :현기
	 * @param memberNo
	 * @return map
	 */
	Map<String, Object> selectMyFundingList(int memberNo,int cp);

	/** 현재 진행중인 펀딩 번호 : 수진
	 * @return nowFundingNo
	 */
	int selectNowFundingNo();

	/**자신이 참여한 펀딩을 상세히 조회하기 위한 Service
	 * @param paymentNo
	 * @return
	 */
	OrderDetail selectOrderDetail(int paymentNo);

	/**[김현기]리워드 선택후 결제 페이지로 넘어가기 위한
	 * @param paramMap
	 * @return
	 */
	Map<String, Object> selectRewardList(Map<String, Object> paramMap,int memberNo);

	/** 리워드 리스트와 리워드별 구매수,금액 : 수진
	 * @param fundingNo
	 * @return
	 */
	Map<String, Object> selectReward(int fundingNo);

	/** 모든 펀딩 리스트 조회 : 수진
	 * @return map
	 */
	Map<String, Object> selectfundingAllList();

	/**결제 수행후 DB로 저장하는 서비스 : 현기
	 * @param orderDetail
	 * @param rewardList
	 * @return
	 */
	int payProgress(OrderDetail orderDetail, List<Reward> rewardList);

	/**주문 상태를 결제 취소 상태로 변경하는 AJAX
	 * @param paymentNo
	 * @return result
	 */
	int cancelPayment(int paymentNo);

	/**주문 상태를 환불 신청으로 변형하는 AJAX
	 * @param paymentNo
	 * @return
	 */
	int refundPayment(int paymentNo);

	/**반품 사유 작성 
	 * @param paymentNo
	 * @param returnReason
	 * @return
	 */
	int retrunPayment(int paymentNo, String returnReason);

	/**반품 사유 작성
	 * @param paymentNo
	 * @return
	 */
	String selectReturn(int paymentNo);


}