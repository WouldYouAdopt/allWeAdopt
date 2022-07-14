package edu.kh.allWeAdopt.board.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.kh.allWeAdopt.board.model.service.BoardService;

import edu.kh.allWeAdopt.board.model.vo.BoardDetail;

@Controller
@RequestMapping("member/myPage/notice")
public class MyNoticeController {
	
	@Autowired
	private BoardService service;
	
	private Logger logger = LoggerFactory.getLogger(AdminNoticeController.class);

	// 관리자 - 공지사항 리스트 조회화면
	@GetMapping("/list")
	public String adminNoticeList( @RequestParam(value="cp", required=false, defaultValue="1") int cp,
								   Model model) {
		
		logger.info("공지사항 리스트 조회 수행됨");
		
		// nList를 조회하는 서비스 호출 ~
		Map<String, Object> map = service.selectNoticeList(cp);
		
		// request범위에 nList 세팅
		model.addAttribute("map", map);
		
		return "notice/noticeList";
	}
	
	// 관리자 - 공지사항 상세조회화면
	@GetMapping("/detail/{boardNo}")
	public String adminNoticeDetail( @PathVariable("boardNo") int boardNo,
								 	 @RequestParam(value="cp", required=false, defaultValue="1") int cp,
								 	 Model model ) {
		
		BoardDetail detail = service.selectNoticeDetail(boardNo); 
		
		model.addAttribute("detail",detail);
		
		return "notice/noticeDetail";
	}

}
