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
	private String targetDonation;  
	private String fundingSeason;
	private int SuccessDonation;
	private String fundingState;
	private String fundingThumbnail;
	private int deliveryFee;
	
	private String month;
	private String startDate;
	private String endDate;
	private int leftDate;
	
	private String CategoryName;
	
	private String fullPrice; // 총 달성한(판매한) 금액
	private int salesRate;
	
	private int supportersNo; // 구매한 서포터즈 인원 수 
	
	private List<FundingImage> imageList;  //해당 유저가 구매한 리워드 수량

	private List<Reward> rewardList; // 리워드정보
	private List<Reward> rewardListCount; // 리워드별 구매개수 + 구매금액

	private List<Supporters> supportersList;
	
}
