package edu.kh.allWeAdopt.funding.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class OrderDetail {
	
	private int fundingNo; //펀딩 번호
	private String fundingCategory; //카테고리 이름
	private String fundingTitle; //펀딩 제목
	private String payDate;  // 결제일 
	private String payMethod; //결제 방식
	private int fullPrice; //모든 리워드 가격 합친거
	private String orderState;  //주문 상태 (결제완료)
	private String recipient;  //수령인
	private String orderPhoneMain; //전화번호1
	private String orderPhoneSub; //전화번호2
	private String orderAddress; //수령인 주소
	private int paymentNo; //결제 번호f
	
	//해당 결제 번호로 구매한 리워드 목록
	private List<Reward> rewardList;
}
