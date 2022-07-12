package edu.kh.allWeAdopt.funding.controller;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.Logger;
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

import edu.kh.allWeAdopt.funding.model.service.FundingService;
import edu.kh.allWeAdopt.funding.model.vo.Funding;
import edu.kh.allWeAdopt.member.model.vo.Member;

@Controller
@RequestMapping("/funding/my")
@SessionAttributes({"loginMember"}) 
public class MyFundingController {
	
	@Autowired
	private FundingService service;

	
	
	
	@GetMapping("/list")
	public String selectMyFundingList(
			@ModelAttribute("loginMember") Member member,
			Model model,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp){
		
		int memberNo = member.getMemberNo();
		
		Map<String, Object> map = null;
		map = service.selectMyFundingList(memberNo,cp);
		
		model.addAttribute("pagination", map.get("pagination"));
		model.addAttribute("fundingList", map.get("fundingList"));
		
		return "funding/my-funding-list";
	}
	
	//funding/my/detail/6
	//funding/my
	@GetMapping("/detail/{paymentNo}")
	public String selectFundingDetail(@PathVariable int paymentNo) {
		
			System.out.println(paymentNo);
			
		return "funding/my-funding-detail";
	}
}
