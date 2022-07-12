package edu.kh.allWeAdopt.funding.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class FundingDetail {
	
	private int fundingNo;
	private String fundingTitle;
	private String fundingMiniTitle;
	private String fundingContent;
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
	
	private List<FundingImage> imageList;

	private List<Reward> rewardList;
	
}
