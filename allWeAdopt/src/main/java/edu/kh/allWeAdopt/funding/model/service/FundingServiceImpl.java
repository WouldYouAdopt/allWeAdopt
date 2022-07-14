package edu.kh.allWeAdopt.funding.model.service;

import java.text.DecimalFormat;
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
import edu.kh.allWeAdopt.funding.model.vo.Supporters;

@Service
public class FundingServiceImpl implements FundingService {

	@Autowired
	private FundingDAO dao;

	// 펀딩 상세 조회
	@Override
	public FundingDetail selectFundingDetail(int fundingNo) {
		
		// 펀딩 번호로 구매이력 count 조회 (구매이력 있는지 없는지 먼저 조회)
		int result = dao.selectCountPay(fundingNo);
		
		if(result>0) { // 구매 이력 있을때
			
			// 펀딩 detail 상세조회
			// 리워드 리스트 : 리워드 + 리워드별 판매수량, 리워드별 판매금액
			FundingDetail detail = dao.selectFundingDetail(fundingNo);
			
			// 리워드별 구매이력 조회 (수량, 금액)
			List<Reward> rewardListCount = dao.selectRewardList(fundingNo);
			
			// 달성금액 구하기
			int sumPrice = 0;
			for(int i=0; i<rewardListCount.size(); i++) {
				sumPrice += rewardListCount.get(i).getRewardOrderPrice();			
			}
			
			DecimalFormat fm = new DecimalFormat("###,###");
			String fullPrice = fm.format(sumPrice);
			
			detail.setFullPrice(fullPrice);
			detail.setRewardListCount(rewardListCount);
			
			// 서포터즈 프로필, 이름, 금액, 이름공개여부, 금액공개여부
			int supportersNo = detail.getSupportersList().size(); // 서포터 몇명이냐
			detail.setSupportersNo(supportersNo);
					
			return detail;

		}else { // 구매이력 없을때
		
			FundingDetail detail = dao.selectFundingSaleZero(fundingNo);
			
			return detail;
			
		}
	}


	
	
	// 이건뭐지 
	private int Integer(String targetDonation) {
		// TODO Auto-generated method stub
		return 0;
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




	
	/**리워드 선택후 결제 페이지로 넘어가기 위한 Service
	 *
	 */
	@Override
	public Map<String, Object> selectRewardList(Map<String, Object> paramMap,int memberNo) {
		
		//1) DB에서 리워드목록을 조회해 해오기
		int fundingNo = Integer.parseInt((String) paramMap.get("fundingNo"));
			//DB에 있는 리워드들을 가져오는 리스트
		List<Reward> rewardList = dao.selectRewardList(fundingNo);
			//실제 선택된 리워드들을 저장하는 리스트
		List<Reward> selectedList = new ArrayList<Reward>();
		
		//2) 조회해온 리워드 번호와 동일한 key가 있을 경우 vo에 담아서 List에 추가
		
			//해당 펀딩을 조회후 모든 리스트들을 반복하면서 
		for(Reward r : rewardList) {
			int rNo = r.getRewardNo();
			System.out.println(paramMap.get(rNo+""));
			if(paramMap.get(rNo+"")!=null&&Integer.parseInt((String) paramMap.get(rNo+""))!=0){
				int amount = Integer.parseInt((String) paramMap.get(rNo+""));
				r.setAmount(amount);
				r.setFullPrice(amount*r.getRewardPrice());
				selectedList.add(r);
			}
		}
		
		OrderDetail prevOrder = null;
		Funding funding = null;
		//null이 아닌 경우 이전 수령지 정보 조회 
		//수령지 정보랑 펀딩 정보를 다 조회해 온다.
		if(!selectedList.isEmpty()){
			prevOrder = dao.selectPrevOrder(memberNo);
			funding = dao.selectFunding(fundingNo);
		}
		
		Map<String, Object>map = new HashMap<String, Object>();
		
		
		map.put("rewardList", selectedList);
		map.put("prevOrder", prevOrder);
		map.put("funding", funding);
		
		
		return map;
	}



	// 리워드 리스트와 리워드별 구매수,금액 : 수진
	@Override
	public Map<String, Object> selectReward(int fundingNo) {
		
		// 리워드 정보
		List<Reward> rewardList = dao.selectOnlyRewardList(fundingNo);
		
		// 펀딩 번호로 구매이력 count 조회 (구매이력 있는지 없는지 먼저 조회)
		int result = dao.selectCountPay(fundingNo);
		
		Map<String, Object> map = new HashMap<String, Object>();

		if(result>0) { //구매이력 있으면
			
			// 리워드별 구매 개수
			List<Reward> rewardListCount = dao.selectRewardOrderCount(fundingNo);
			
			map.put("rewardList", rewardList);
			map.put("rewardListCount", rewardListCount);

		}else {
			
			map.put("rewardList", rewardList);
			
		}
		
		
		return map;
	}



	// 모든 펀딩 리스트 조회
	@Override
	public Map<String, Object> selectfundingAllList() {
		
		// 지금 진행중인 펀딩 리스트 조회
		FundingDetail now = dao.selectNowFundinginfo(); 
		int fundingNo = now.getFundingNo();

		// 펀딩 번호로 구매이력 있는지 조회
		int result = dao.selectCountPay(fundingNo);

		if(result>0) { // 구매이력 있으면 리워드 정보 + 결제정보
			
		}else { // 구매이력 없으면 단순 리워드 정보만
			
		}
			
		
		
		// 종료된 펀딩 리스트 조회
		//FundingDetail end = dao.selectEndfundinginfo();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("now", now);
		//map.put("end", end);
		
		return map;
	}
	
	
	
	
	
	
}
