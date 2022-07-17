package edu.kh.allWeAdopt.funding.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class FundingDetail {
	
	private int fundingNo; //펀딩 번호
	private String fundingTitle; //펀딩 제목
	private String fundingMiniTitle; //펀딩 소제목
	private String fundingContent; //펀딩 내용
	private String targetDonation;  //목표 후원금
	private String fundingSeason; //진행 월
	private int SuccessDonation;  //성공 
	private String fundingState; //펀딩 상태
	private String fundingThumbnail; //섬네일 이미지 경로
	private int deliveryFee; //배송비
	
	private String month;
	private String startDate;
	private String endDate;
	private int leftDate;
	
	private String categoryName;
	private int categoryNo; // 펀딩 카테고리
	
	private int fullPriceInt; // 총 달성한(판매한) 금액
	private String fullPrice; // 총 달성한(판매한) 금액
	private int salesRate;
	
	private String sendDate; // 발송일 (현재날짜 구하기> 다음달 의 1일)
	
	private int supportersNo; // 구매한 서포터즈 인원 수 
	
	private List<FundingImage> imageList;  //해당 유저가 구매한 리워드 수량

	private List<Reward> rewardList; // 리워드정보
	private List<Reward> rewardListCount; // 리워드별 구매개수 + 구매금액

	private List<Supporters> supportersList;
	
}
