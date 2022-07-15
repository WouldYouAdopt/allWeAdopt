package edu.kh.allWeAdopt.funding.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Reward {

	private int rewardNo; //리워드 번호
	private String rewardTitle; //리워드 타이틀
	private String rewardContent; //리워드 내용
	private int rewardPrice; //개별가격
	private int fullPrice; //총 가격
	private int maxRewardNo; //최대 리워드 개수
	private int fundingNo; //펀딩 번호
	private int amount;  //구매 갯수
	
	private int rewardOrderAmount; // 리워드별 판매된 수량
	private int rewardOrderPrice; // 리워드별 판매된 금액

	private int paymentNo;//결제번호 insert할때 쓰기 위해
}
