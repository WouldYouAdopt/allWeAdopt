package edu.kh.allWeAdopt.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@ToString
public class Board {
	
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
	private String boardPeriod;
	private String boardPeriod2;
	private String memberName;
	private long diff;
	private long diff2;
	private String profileImage;
	// 게시글 답변 완/미완 == 코멘트 유/무
	private String answer;

	private String thumbnail;

	private String area;
	private String areaDetail;
	private String animalType;
	private String animalDetail;
	private String gender;
	private String neutering;

}
