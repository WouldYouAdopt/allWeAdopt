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

@Repository
public class FundingDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 펀딩 상세 조회 DAO
	 * @param fundingNo
	 * @return detail
	 */
	public FundingDetail selectFundingDetail(int fundingNo) {
		return sqlSession.selectOne("fundingMapper.selectFundingDetail",fundingNo);
	}

	
	/**페이지 네이션을 만들기 위한 내가 참여한 펀딩의 개수를 조회하는 DAO
	 * @param memberNo
	 * @return
	 */
	public int getFundingCount(int memberNo) {
		return sqlSession.selectOne("fundingMapper.getFundingCount",memberNo);
	}


	/**해당 회원의 펀딩 목록을 조회하는 DAO
	 * @param pagination
	 * @param memberNo
	 * @return
	 */
	public List<Funding> selectBoardList(Pagination pagination, int memberNo) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("fundingMapper.selectMyFundingList", memberNo, rowBounds);
	}


	/** 현재 진행중인 펀딩 번호
	 * @return
	 */
	public int selectNowFundingNo() {
		return sqlSession.selectOne("fundingMapper.selectNowFundingNo");
	}

	
	/**주문정보 상세히 조회하기 위한 Service
	 * @param paymentNo
	 * @return
	 */
	public OrderDetail selectOrderDetail(int paymentNo) {
		return sqlSession.selectOne("fundingMapper.selectOrderDetail",paymentNo);
	}

}
