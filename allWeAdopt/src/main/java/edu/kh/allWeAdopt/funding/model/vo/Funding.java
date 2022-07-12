package edu.kh.allWeAdopt.funding.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Funding {
	
	private int fundingNo;
	private String fundingTitle;
	private String fundingMiniTitle;
	private String fundingContent;
	private int targetDonation;
	private String fundingSeason;
	private int SuccessDonation;
	private String fundingState;
	private String fundingThumbnail;
	private int deliveryFee;
	private int fundingCategory;
	

}
