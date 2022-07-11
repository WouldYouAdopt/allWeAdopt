package edu.kh.allWeAdopt.shelter.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@ToString
public class ShelterReply {
	
	private int replyNo;
	private String replyContent;
	private String createDate;
	private int memberNo;
	private String memberNickname;
	private String profileImage;
	private int parentReplyNo;
	String desertionNo; // 유기번호

}
