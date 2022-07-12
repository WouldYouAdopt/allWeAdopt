package edu.kh.allWeAdopt.funding.model.service;

import edu.kh.allWeAdopt.funding.model.vo.FundingDetail;

public interface FundingService {

	
	/** 펀딩 상세 조회
	 * @param fundingNo
	 * @return detail
	 */
	FundingDetail selectFundingDetail(int fundingNo);

}
