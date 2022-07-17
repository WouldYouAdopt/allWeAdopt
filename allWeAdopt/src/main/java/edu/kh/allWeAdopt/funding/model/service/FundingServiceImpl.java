package edu.kh.allWeAdopt.funding.model.service;

import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.allWeAdopt.board.model.vo.Pagination;
import edu.kh.allWeAdopt.common.Util;
import edu.kh.allWeAdopt.common.exception.FailReturnException;
import edu.kh.allWeAdopt.funding.model.dao.FundingDAO;
import edu.kh.allWeAdopt.funding.model.vo.Funding;
import edu.kh.allWeAdopt.funding.model.vo.FundingDetail;
import edu.kh.allWeAdopt.funding.model.vo.OrderDetail;
import edu.kh.allWeAdopt.funding.model.vo.Reward;
import edu.kh.allWeAdopt.funding.model.vo.Supporters;

/**
 * @author deadWhale
 *
 */
/**
 * @author deadWhale
 *
 */
/**
 * @author deadWhale
 *
 */
/**
 * @author deadWhale
 *
 */
/**
 * @author deadWhale
 *
 */
@Transactional(rollbackFor = { Exception.class })
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
			
			detail.setFullPrice(fullPrice); // 해당 펀딩의 전체 판매 금액
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


	
	/**[김현기]리워드 선택후 결제 페이지로 넘어가기 위한 Service
	 *
	 */
	@Override
	public Map<String, Object> selectRewardList(Map<String, Object> paramMap,int memberNo) {
		
		//1) DB에서 리워드목록을 조회해 해오기
		int fundingNo = Integer.parseInt((String) paramMap.get("fundingNo"));
			//DB에 있는 리워드들을 가져오는 리스트
		List<Reward> rewardList = dao.selectOnlyRewardList(fundingNo);
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
		
		
		// 지금 진행중인 펀딩 번호
		int fundingNo = dao.selectNowFundingNo();
		
		// 펀딩 번호로 구매이력 있는지 조회
		int result = dao.selectCountPay(fundingNo);

		FundingDetail now;
		if(result>0) { // 구매이력 있으면 리워드 정보 + 결제정보
			now = dao.selectFundingDetail(fundingNo);
			
			// 달성 금액이 필요해서 계산하려고 가져오는 정보
			// 리워드별 구매이력 조회 (수량, 금액) rewardList에는 기존 리워드 정보 들어있어서 새로만듦
			List<Reward> rewardListCount = dao.selectRewardList(fundingNo);
			
			// 달성금액 구하기
			int sumPrice = 0;
			for(int i=0; i<rewardListCount.size(); i++) {
				sumPrice += rewardListCount.get(i).getRewardOrderPrice();			
			}
			
			DecimalFormat fm = new DecimalFormat("###,###");
			String fullPrice = fm.format(sumPrice);
			
			now.setFullPrice(fullPrice); // 달성금액 완료
			
		}else { // 구매이력 없으면 단순 리워드 정보만
			now = dao.selectNowFundinginfo(); 
			List<Reward> rewardList = new ArrayList<Reward>();
			rewardList = dao.selectOnlyRewardList(fundingNo);
			now.setRewardList(rewardList);
		}
		
		
		
		
		// 종료된 펀딩 리스트 조회 (판매이력 있다는 전제)
		List<FundingDetail> endList = dao.selectEndFundinginfo();

		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("endList", endList);
		map.put("now", now);
		
		return map;
	}




	
	
	//결제 수행후 DB로 저장하는 서비스 : 현기
	@Override
	public int payProgress(OrderDetail orderDetail, List<Reward> rewardList) {
		 
			int paymentNo = 0;
			
			//결제 정보를 삽입하는 dao
			int result = dao.insertPaymentInfo(orderDetail);
			if(result>0) {
				
				
				for(Reward r : rewardList) {
					r.setPaymentNo(orderDetail.getPaymentNo());
				}
				
				result=dao.insertRewardList(rewardList);
				
				if(result>0) {
					paymentNo = orderDetail.getPaymentNo();
				}
			}
			
		return paymentNo;
	}





	//결제 취소 상태로 업데이트 [김현기]
	@Override
	public int cancelPayment(int paymentNo) {
		return dao.cancelPayment(paymentNo);
	}
	
	//환불 신청 상태로 업데이트 [김현기]
	@Override
	public int refundPayment(int paymentNo) {
		return dao.refundPayment(paymentNo);
	}

	//반품 신청 상태로 변경하면서 반품 사유 보내기
	@Override
	public int retrunPayment(int paymentNo, String returnReason) {
		
		int result = dao.retrunPaymentStats(paymentNo);
		if(result>0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("paymentNo", paymentNo);
			map.put("returnReason", returnReason);
			result = dao.insertReason(map);
			
			if(result==0) {
				throw new FailReturnException();
			}
		}
		return result;
	}




	//반품조회
	@Override
	public String selectReturn(int paymentNo) {
		return dao.selectReturn(paymentNo);
	}




	//펀딩 등록
	@Override
	public int fundingRegister(FundingDetail fundingDetail, MultipartFile uploadImage, String webPath,
			String folderPath)throws Exception{
		
		
//		해야하는데 수진님이 하셨는지 확인 필요
//		fundingDetail.setFundingTitle(Util.newLineHandling(fundingDetail.getFundingTitle()));
//		
//		fundingDetail.setFundingMiniTitle(Util.newLineHandling(fundingDetail.getFundingMiniTitle()));
//		fundingDetail.setFundingMiniTitle(Util.XSSHandling(fundingDetail.getFundingMiniTitle()));
		
		String rename = Util.fileRename(uploadImage.getOriginalFilename());
		fundingDetail.setFundingThumbnail(webPath+rename);
		
		//성공 금액 계산에서 세팅해주기
		fundingDetail.setSuccessDonation((int)(Integer.parseInt(fundingDetail.getTargetDonation()) * 0.8));
	
		int fundingNo = dao.fundingRegister(fundingDetail);
		
		if(fundingNo>0) {
			//펀딩 등록 리워드 목록에 저장하기
			for(Reward r : fundingDetail.getRewardList() ) {
				r.setFundingNo(fundingNo);
			}
			//리워드목록들 저장하고
			fundingNo = dao.registerRewardList(fundingDetail.getRewardList());
			
			//이미지 서버에 업로드
			uploadImage.transferTo(new File(folderPath+rename));
		}
		
		return fundingNo;
	}



	// 진행예정중인 펀딩 썸네일 + 카테고리 + 타이틀
	@Override
	public List<FundingDetail> selectFundingSList() {
		return dao.selectFundingSList();
	}



	//펀딩 리워드 목록 '만' 조회하는 함수(오버로딩) :현기 
	@Override
	public List<Reward> selectRewardList(int fundingNo) {
		return dao.selectOnlyRewardList(fundingNo);
	}


	
    // 펀딩 썸네일+제목만 조회 : 수진
	@Override
	public Funding selectfunding(int fundingNo) {
		return dao.selectFunding(fundingNo);
	}


	

	
	
	
	
	
	
	
	
	
	
	
}
