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
	private int maxRewardNo;
	private int fundingNo;
}
