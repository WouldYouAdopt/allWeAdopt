package edu.kh.allWeAdopt.funding.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Supporters {

	private int memberNo;
	private String memberName;
	private String profileImage;
	private int time; // (SYSDATE-PAY_DT)*24*60*60 '50분전 결제' 구현 하기 위함
	private String timeForString;
	private String nameOpen;
	private String priceOpen;
	private int payFullPrice;
	
}
