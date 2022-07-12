package edu.kh.allWeAdopt.funding.controller;

import org.apache.logging.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/funding/my")
public class MyFundingController {
	
	Logger log = (Logger) LoggerFactory.getLogger(MyFundingController.class);
	
	
	
	@GetMapping("/list")
	public String selectMyList() {
		
		
		return "funding/my-funding-list";
	}
}
