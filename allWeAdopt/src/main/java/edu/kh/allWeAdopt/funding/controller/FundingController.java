package edu.kh.allWeAdopt.funding.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kh.allWeAdopt.funding.model.service.FundingService;
import edu.kh.allWeAdopt.funding.model.vo.FundingDetail;

@Controller
@RequestMapping("/funding")
public class FundingController {
	
	@Autowired
	private FundingService service;

	
	@GetMapping("/list")
	public String list() {
		
		Map<String, Object> map = null;
		/* map = service.selectFundingList(); */
		
		return "funding/funding-list";
	}

	
	
	
	
	@GetMapping("/detail/{fundingNo}")
	public String detail(@PathVariable("fundingNo") int fundingNo
						, Model model) {
		
		FundingDetail detail = service.selectFundingDetail(fundingNo);
		
		if(detail!=null) { // 펀딩상세조회 성공 시
			model.addAttribute("detail",detail);
		}
		
		return "funding/funding-detail";
	}
	
	
	
	
	
	
	
	
	@GetMapping("/reward")
	public String rewardSelect() {
		return "funding/reward-select";
	}

	
	
	
}
