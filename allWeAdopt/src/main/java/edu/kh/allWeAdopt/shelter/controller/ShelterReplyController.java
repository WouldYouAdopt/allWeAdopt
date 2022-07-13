package edu.kh.allWeAdopt.shelter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import edu.kh.allWeAdopt.shelter.model.service.ShelterReplyService;
import edu.kh.allWeAdopt.shelter.model.vo.ShelterReply;

@RequestMapping("/shelterReply")
@RestController
public class ShelterReplyController {
	
	
	@Autowired
	private ShelterReplyService service;
	
	
	// 댓글 목록 조회
	public String selectReplyList(String desertionNo) {
		
		List<ShelterReply> rList = service.selectReplyList(desertionNo);
		
		return new Gson().toJson(rList);
		
	}
	
	
	// 댓글 등록
	@PostMapping
	public int insertReply(ShelterReply shelterReply) {
//		return service.insertReply(shelterReply);
	}
	
	
	// 댓글 삭제
	@ResponseBody
	@GetMapping("/delete")
	public int deleteReply(int replyNo) {
//		return service.deleteReply(replyNo);
	}
	
	
	// 댓글 수정
	@PostMapping("/update")
	public int updateReply(ShelterReply shelterReply) {
//		return service.updateReply(shelterReply);
	}
	
	

}
