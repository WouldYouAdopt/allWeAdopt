package edu.kh.allWeAdopt.funding.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.allWeAdopt.funding.model.service.FundingService;
import edu.kh.allWeAdopt.funding.model.vo.OrderDetail;
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
	public String selectOrderDetail(@PathVariable int paymentNo,Model model,RedirectAttributes ra) {
		
		
		OrderDetail detail = service.selectOrderDetail(paymentNo);
			
		if(detail != null) {
			model.addAttribute("detail", detail);
		}else{
			ra.addFlashAttribute("message", "조회중 오류가 발생했습니다.");
			return "redirect:/";
		}
			
		
		
		return "funding/my-funding-detail";
	}

	@GetMapping("/pay")
	public String Payment(){
		return "funding/funding-payment";
	}
	
	@PostMapping("/pay")
	public String Payment(@RequestParam Map<String, Object>paramMap){
		
		return "funding/funding-payment";
	}
	
}
