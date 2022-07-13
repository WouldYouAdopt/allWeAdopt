package edu.kh.allWeAdopt.shelter.model.service;

import java.util.List;

import edu.kh.allWeAdopt.shelter.model.vo.ShelterReply;

public interface ShelterReplyService {


	/** 댓글 목록 조회
	 * @param desertionNo
	 * @return
	 */
	List<ShelterReply> selectReplyList(String desertionNo);

}
