package edu.kh.allWeAdopt.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	// main으로 이동
	@RequestMapping("/main")
	public String mainForward() {

		// main페이지에 바로 출력하고 싶은 내용이 있으면
		// 여기서 서비스를 호출한 뒤 main으로 forward하면됨~~~
		
		return "common/main";
	}
	
	// admin-main으로 이동
	@RequestMapping("/admin/main")
	public String adminMainForward() {
		
		return "common/admin-main";
	}
	
	

}