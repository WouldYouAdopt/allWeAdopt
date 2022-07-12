package edu.kh.allWeAdopt.funding.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Reward {

	private int rewardNo;
	private String rewardTitle;
	private String rewardContent;
	private int rewardPrice;
	private int fullPrice;
	private int maxRewardNo;
	private int fundingNo;
	private int amount;
	
	private int rewardOrderAmount; // 리워드별 판매된 수량
	private int rewardOrderPrice; // 리워드별 판매된 금액
}
