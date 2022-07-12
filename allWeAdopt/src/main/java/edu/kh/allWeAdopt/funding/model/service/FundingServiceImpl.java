package edu.kh.allWeAdopt.funding.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.allWeAdopt.board.model.vo.Pagination;
import edu.kh.allWeAdopt.funding.model.dao.FundingDAO;
import edu.kh.allWeAdopt.funding.model.vo.Funding;
import edu.kh.allWeAdopt.funding.model.vo.FundingDetail;

@Service
public class FundingServiceImpl implements FundingService {

	@Autowired
	private FundingDAO dao;

	// 펀딩 상세 조회
	@Override
	public FundingDetail selectFundingDetail(int fundingNo) {
		
		// 펀딩 상세조회
		
		// 펀딩 현재달성 금액 : reward, reward_order 에서 값 가져와서 계산해야하지? 
		
		// 펀딩 이미지리스트 가져오고
		
		// 리워드를 같이? 따로 가져올까?
		
		
		return dao.selectFundingDetail(fundingNo);
	}

	
	
	//자신의 펀딩 목록 조회
	@Override
	public Map<String, Object> selectMyFundingList(int memberNo,int cp) {

		//자신이 참여한 모든 펀딩 개수를 조회
		int listCount = dao.getFundingCount(memberNo);
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Funding> fundingList = dao.selectBoardList(pagination, memberNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pagination", pagination);
		map.put("fundingList", fundingList);
		
		return map;
	}


	// 현재 진행중인 펀딩 번호
	@Override
	public int selectNowFundingNo() {
		return dao.selectNowFundingNo();
	}
	
	
	
	
	
	
}
