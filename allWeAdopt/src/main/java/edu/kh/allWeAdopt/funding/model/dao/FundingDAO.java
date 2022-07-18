package edu.kh.allWeAdopt.funding.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.allWeAdopt.board.model.vo.Pagination;
import edu.kh.allWeAdopt.funding.model.vo.Funding;
import edu.kh.allWeAdopt.funding.model.vo.FundingDetail;
import edu.kh.allWeAdopt.funding.model.vo.OrderDetail;
import edu.kh.allWeAdopt.funding.model.vo.Reward;

@Repository
public class FundingDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 펀딩 상세 조회 DAO
	 * 
	 * @param fundingNo
	 * @return detail
	 */
	public FundingDetail selectFundingDetail(int fundingNo) {
		return sqlSession.selectOne("fundingMapper.selectFundingDetail", fundingNo);
	}

	/**
	 * 페이지 네이션을 만들기 위한 내가 참여한 펀딩의 개수를 조회하는 DAO
	 * 
	 * @param memberNo
	 * @return
	 */
	public int getFundingCount(int memberNo) {
		return sqlSession.selectOne("fundingMapper.getFundingCount", memberNo);
	}

	/**
	 * 해당 회원의 펀딩 목록을 조회하는 DAO
	 * 
	 * @param pagination
	 * @param memberNo
	 * @return
	 */
	public List<Funding> selectBoardList(Pagination pagination, int memberNo) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("fundingMapper.selectMyFundingList", memberNo, rowBounds);
	}

	/**
	 * 현재 진행중인 펀딩 번호를 조회하는 DAO
	 * 
	 * @return
	 */
	public int selectNowFundingNo() {
		return sqlSession.selectOne("fundingMapper.selectNowFundingNo");
	}

	/**
	 * 주문정보 상세히 조회하기 위한 DAO
	 * 
	 * @param paymentNo
	 * @return
	 */
	public OrderDetail selectOrderDetail(int paymentNo) {
		return sqlSession.selectOne("fundingMapper.selectOrderDetail", paymentNo);
	}

	/**
	 * 펀딩의 리워드목록들을 조회하는 DAO [김현기]
	 * 
	 * @param INT FUNDINGnO
	 * @return
	 */
	public List<Reward> selectOnlyRewardList(int fundingNo) {
		return sqlSession.selectList("fundingMapper.selectOnlyRewardList", fundingNo);
	}

	/**
	 * 주문자의 이전 수령지 정보를 조회하는 DAO
	 * 
	 * @param memberNo
	 * @return
	 */
	public OrderDetail selectPrevOrder(int memberNo) {
		return sqlSession.selectOne("fundingMapper.selectPrevOrder", memberNo);
	}

	/**
	 * 그냥 펀딩 조회용 Service ( ***Detail 조회가 아님*** )
	 * 
	 * @param fundingNo
	 * @return
	 */
	public Funding selectFunding(int fundingNo) {
		return sqlSession.selectOne("fundingMapper.selectfunding", fundingNo);
	}

	/**
	 * 구매이력 수 조회 (구매이력 있는 펀딩인지 아닌지 구분)
	 * 
	 * @param fundingNo
	 * @return result
	 */
	public int selectCountPay(int fundingNo) {
		return sqlSession.selectOne("fundingMapper.selectCountPay", fundingNo);
	}

	/**
	 * 구매이력 없는 펀딩 detail조회
	 * 
	 * @param fundingNo
	 * @return
	 */
	public FundingDetail selectFundingSaleZero(int fundingNo) {
		return sqlSession.selectOne("fundingMapper.selectFundingSaleZero", fundingNo);
	}

	/**
	 * 리워드 + 리워드별 판매수량, 판매금액 조회
	 * 
	 * @param rewardList
	 * @return
	 */
	public List<Reward> selectRewardList(int fundingNo) {
		return sqlSession.selectList("fundingMapper.selectRewardList", fundingNo);
	}

	/**
	 * 리워드별 판매수량, 판매금액 만
	 * 
	 * @param fundingNo
	 * @return
	 */
	public List<Reward> selectRewardOrderCount(int fundingNo) {
		return sqlSession.selectList("fundingMapper.selectRewardOrderCount", fundingNo);
	}

	/**
	 * 현재 진행중인 펀딩의 정보들
	 * 
	 * @return
	 */
	public FundingDetail selectNowFundinginfo() {
		return sqlSession.selectOne("fundingMapper.selectNowFundinginfo");
	}

	/** 종료된 펀딩 목록들 조회
	 * @return
	 */
	public List<FundingDetail> selectEndFundinginfo() {
		return sqlSession.selectList("fundingMapper.selectEndFundinginfo");
	}

	/**결제정보를 삽입하는 sql
	 * @param orderDetail
	 * @return
	 */
	public int insertPaymentInfo(OrderDetail orderDetail) {
		return sqlSession.insert("fundingMapper.insertPaymentInfo",orderDetail);
	}

	/**리워드를 저장하는 함수
	 * @param rewardList
	 * @return
	 */
	public int insertRewardList(List<Reward> rewardList) {
		return sqlSession.insert("fundingMapper.insertRewardList",rewardList);
	}

	/**결제 취소상태로 업데이트 하는 sql
	 * @param paymentNo
	 * @return
	 */
	public int cancelPayment(int paymentNo) {	
		return sqlSession.update("fundingMapper.cancelPayment",paymentNo);
	}
	
	/**환불 상태로 업데이트 하는 sql
	 * @param paymentNo
	 * @return
	 */
	public int refundPayment(int paymentNo) {
		return sqlSession.update("fundingMapper.refundPayment",paymentNo);
	}

	/**반품 상태로 업데이트하는 sql
	 * @param paymentNo
	 * @return
	 */
	public int retrunPaymentStats(int paymentNo) {
		return sqlSession.update("fundingMapper.retrunPaymentStats",paymentNo);
	}

	/**반품 사유 작성 
	 * @param map
	 * @return
	 */
	public int insertReason(Map<String, Object> map) {
		return sqlSession.insert("fundingMapper.insertReason",map);
	}

	/**반품 조회
	 * @param paymentNo
	 * @return
	 */
	public String selectReturn(int paymentNo) {
		return sqlSession.selectOne("fundingMapper.selectReturn",paymentNo);
	}

	/**펀딩 등록
	 * @param fundingDetail
	 * @return
	 */
	public int fundingRegister(FundingDetail fundingDetail) {
		int result = sqlSession.insert("fundingMapper.registerFunding",fundingDetail);
			if(result>0) {
				result = fundingDetail.getFundingNo();
			}
		return result;
	}

	public int registerRewardList(List<Reward> rewardList) {
		return sqlSession.insert("fundingMapper.registerRewardList",rewardList);
	}

	/** 진행예정중인 펀딩 썸네일 + 카테고리 + 타이틀
	 * @return
	 */
	public List<FundingDetail> selectFundingSList() {
		return sqlSession.selectList("fundingMapper.selectFundingSList");
	}

	public int fundingUpdate(FundingDetail fundingDetail) {
		return sqlSession.update("fundingMapper.fundingUpdate",fundingDetail);
	}

	public String selectThumbnail(int fundingNo) {
		return sqlSession.selectOne("fundingMapper.selectThumbnail",fundingNo);
	}

	public int deleteRewardList(int fundingNo) {
		return sqlSession.delete("fundingMapper.deleteRewardList",fundingNo);
	}

	/** 종료된 펀딩 넘버 모두 가져오기
	 * @return
	 */
	public List<Integer> selectEndCount() {
		return sqlSession.selectList("fundingMapper.selectEndCount");
	}




}
