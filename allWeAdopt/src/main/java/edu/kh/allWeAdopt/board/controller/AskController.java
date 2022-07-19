package edu.kh.allWeAdopt.board.controller;

import java.util.Map;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.allWeAdopt.board.model.service.BoardService;
import edu.kh.allWeAdopt.member.model.vo.Member;

@Controller
@RequestMapping("/member/myPage")
@SessionAttributes({"loginMember"})
public class AskController {


	@Autowired
	private BoardService service;
	
	private Logger logger = LoggerFactory.getLogger(AdminNoticeController.class);
	
	
	
	// 문의사항 리스트 조회
	@GetMapping("/ask/list")
	public String askList(@RequestParam(value="cp", required=false, defaultValue="1") int cp,
						  Model model,
						  @ModelAttribute("loginMember") Member loginMember ) {
		
		
		
		// aList를 조회하는 서비스 호출 
		Map<String, Object> map = service.selectaskList(cp,loginMember);
		
		// request범위에 nList 세팅
		model.addAttribute("map", map);
		
		return "ask/askList";
	}
	
	
	// 문의사항 상세 조회
	@GetMapping("/ask/detail/{boardNo}")
	public String askDetail( @PathVariable("boardNo") int boardNo,
						 	 @RequestParam(value="cp", required=false, defaultValue="1") int cp,
						 	 Model model ) {
		
		
		return "ask/askDetail";
	}
	
	
	
	// 문의사항 글작성
	@GetMapping("/ask/write")
	public String askWrite() {
		
		
		return "ask/askWrite";
	}
	
	
	
	
	
}
