package edu.kh.allWeAdopt.userBoard.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.allWeAdopt.member.model.vo.Member;
import edu.kh.allWeAdopt.userBoard.model.service.MyPageBoardService;



@Controller
@RequestMapping("/member/myPage")
@SessionAttributes({"loginMember"})
public class MyPageBoardController {
	
	@Autowired
	private MyPageBoardService service;
	
	// 게시글 리스트
	@RequestMapping("/boardList")
	public String myPageBoard(Model model,
			@RequestParam(value="cp", required = false, defaultValue = "1") int cp,
			@ModelAttribute("loginMember") Member loginMember) {
		
		int memberNo = loginMember.getMemberNo();
		// 페이지네이션
		Map<String, Object> map = service.MyPageBoardService(cp, memberNo);
		
		model.addAttribute("map", map);
		return "board/myPageList";
	}
	
}
