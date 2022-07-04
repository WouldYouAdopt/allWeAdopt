package edu.kh.allWeAdopt.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/main")
	public String mainForward() {
		// index.jsp의 forward를 처리하는 mainForward에서
		// common/main.jsp로 한 번 더 forward함
		// index에서 forward 한 내용을 한 번 더 forward한것!!!!!
		
		// main페이지에 바로 출력하고 싶은 내용이 있으면
		// 여기서 서비스를 호출한 뒤 main으로 forward하면됨~~~
		
		return "common/main";
	}

}