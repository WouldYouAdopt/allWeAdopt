package edu.kh.allWeAdopt.funding.model.dao;

import java.util.List;

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



}
