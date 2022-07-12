package edu.kh.allWeAdopt.funding.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Funding {
	
	private int fundingNo;   //펀딩 번호
	private String fundingTitle;  // 펀딩 제목
	private String fundingMiniTitle; //펀딩 소제목
	private int targetDonation;    //목표 금약
	private String fundingSeason; //펀딩 진행 월
	private int SuccessDonation; //성공 금액
	private String fundingState; //펀딩 상태
	private String fundingThumbnail;  // 펀딩 섬네일 이미지
	private int deliveryFee; //배송비
	private String fundingCategory; //펀딩 종류
	private String payDate; //결제일

	private int paymentNo; //결제번호
	
	private String orderState; //결제 상태

}
