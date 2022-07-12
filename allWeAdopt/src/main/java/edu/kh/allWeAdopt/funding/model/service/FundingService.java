package edu.kh.allWeAdopt.funding.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.allWeAdopt.funding.model.vo.Funding;
import edu.kh.allWeAdopt.funding.model.vo.FundingDetail;

public interface FundingService {

	
	/** 펀딩 상세 조회
	 * @param fundingNo
	 * @return detail
	 */
	FundingDetail selectFundingDetail(int fundingNo);

	/**자신이 참여한 펀딩 목록들을 조회후 페이지네이션과 같이 가져오는 함수
	 * @param memberNo
	 * @return map
	 */
	Map<String, Object> selectMyFundingList(int memberNo,int cp);


}
