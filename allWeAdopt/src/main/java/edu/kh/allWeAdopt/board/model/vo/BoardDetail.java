package edu.kh.allWeAdopt.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class BoardDetail {
	
	private int boardNo;
	private String boardTitle;
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
	private String memberName;
	private String profileImage;
	private String boardName;
	private String thumbnail;
	
}
