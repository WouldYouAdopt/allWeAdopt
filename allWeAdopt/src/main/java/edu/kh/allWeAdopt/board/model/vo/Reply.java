package edu.kh.allWeAdopt.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@ToString
public class Reply {
	
	private int replyNo;
	private String replyContent;
	private String createDate;
	private int boardNo;
	private int memberNo;
	private String memberName;
	private String profileImage;
	private int parentReplyNo;
	private String replySt;

}
