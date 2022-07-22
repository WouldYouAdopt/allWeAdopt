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
	private String payDate; // (SYSDATE-PAY_DT)*24*60*60 '50분전 결제' 구현 하기 위함
	private String payDate2; // 결제날짜 그대로>> ORDER BY 정렬하려고
	private String nameOpen;
	private String priceOpen;
	private int payFullPrice;
	
}
