package edu.kh.allWeAdopt.userBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kh.allWeAdopt.userBoard.model.service.UserBoardService;

@Controller
@RequestMapping("/board")
public class UserBoardController {

	@Autowired
	private UserBoardService service;
	
	@GetMapping("/user")
	public String boardList() {
		
		
		return "board/userBoardList";
	}
	
	@GetMapping("/user/boardRegist")
	public String boardRegist() {
		
		return "board/userBoardRegist";
	}
}
