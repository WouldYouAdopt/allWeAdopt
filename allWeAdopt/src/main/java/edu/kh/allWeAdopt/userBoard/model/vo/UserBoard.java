package edu.kh.allWeAdopt.userBoard.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class UserBoard {
	private int boardNo;
	private String boardContent;
	private String category;
	private String boardSt;
	private String phone;
	private int boardCode;
	private int memberNo;
	private String createDate;
	private String updateDate;
	private String boardPeriodS;
	private String boardPeriodE;
}
