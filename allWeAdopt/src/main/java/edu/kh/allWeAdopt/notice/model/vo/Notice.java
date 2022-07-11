package edu.kh.allWeAdopt.notice.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Notice {

	private int boardNo; // BOARD_NO
	private String boardTitle; // BOARD_TITLE
	private String boardContent; // BOARD_CONTENT
	private String createDate; // CREATE_DT
	private String updateDate; // UPDATE_DT
	private String boardState; //CATEGORY
	private int boardCode; // BOARD_CD
	private int memberNo; // MEMBER_NO
	
}
