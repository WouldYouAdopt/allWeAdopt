package edu.kh.allWeAdopt.funding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/funding")
public class FundingController {

	@GetMapping("/detail")
	public String detail() {
		return "funding/funding-detail";
	}
	
	@GetMapping("/list")
	public String list() {
		return "funding/funding-list";
	}
	
	@GetMapping("/reward")
	public String rewardSelect() {
		return "funding/reward-select";
	}
}
