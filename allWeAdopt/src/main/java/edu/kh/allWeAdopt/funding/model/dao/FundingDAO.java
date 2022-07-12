package edu.kh.allWeAdopt.funding.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.allWeAdopt.funding.model.vo.FundingDetail;

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

}
