package edu.kh.allWeAdopt.board.controller;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.allWeAdopt.board.model.service.BoardService;

@Controller
@RequestMapping("/member/myPage/ask")
@SessionAttributes({"loginMember"})
public class AskController {


	@Autowired
	private BoardService service;
	
	private Logger logger = LoggerFactory.getLogger(AdminNoticeController.class);
	
	
	
	
	
	
}
