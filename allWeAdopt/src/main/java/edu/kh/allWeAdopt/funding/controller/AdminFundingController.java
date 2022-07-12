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
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.allWeAdopt.funding.model.service.FundingService;
import edu.kh.allWeAdopt.funding.model.vo.Funding;
import edu.kh.allWeAdopt.funding.model.vo.OrderDetail;
import edu.kh.allWeAdopt.member.model.vo.Member;

@Controller
@RequestMapping("/admin/funding")
@SessionAttributes({"loginMember"}) 
public class AdminFundingController {
	
	@Autowired
	private FundingService service;

		
	
	@GetMapping("/management")
	public String selectManagementPage() {
		return "funding/admin/funding-management";
	}

	@GetMapping("/register")
	public String findingRegister() {
		return "funding/admin/funding-register";
	}
}
