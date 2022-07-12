package edu.kh.allWeAdopt.funding.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.allWeAdopt.board.model.vo.Pagination;
import edu.kh.allWeAdopt.funding.model.dao.FundingDAO;
import edu.kh.allWeAdopt.funding.model.vo.Funding;
import edu.kh.allWeAdopt.funding.model.vo.FundingDetail;
import edu.kh.allWeAdopt.funding.model.vo.OrderDetail;
import edu.kh.allWeAdopt.funding.model.vo.Reward;

@Service
public class FundingServiceImpl implements FundingService {

	@Autowired
	private FundingDAO dao;

	// 펀딩 상세 조회
	@Override
	public FundingDetail selectFundingDetail(int fundingNo) {
		
		// 펀딩 상세조회
		FundingDetail detail = dao.selectFundingDetail(fundingNo);
		
		// 리워드 + 리워드별 판매수량, 리워드별 판매금액
		
		
		// 펀딩 이미지리스트
		// 서포터즈 프로필, 이름, 금액, 이름공개여부, 금액공개여부
		
		
		return detail;
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

	//주문정보 상세히 조회하기 위한 Service
	@Override
	public OrderDetail selectOrderDetail(int paymentNo) {
		return dao.selectOrderDetail(paymentNo);
	}
	
	
	
	
	
	
}
