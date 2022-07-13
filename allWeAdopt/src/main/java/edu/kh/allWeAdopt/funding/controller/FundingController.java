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

	// 펀딩 리스트 조회
	@GetMapping("/list")
	public String list() {
		
		Map<String, Object> map = null;
		/* map = service.selectFundingList(); */
		
		return "funding/funding-list";
	}

	
	
	
	// 펀딩 상세조회
	@GetMapping("/detail/{fundingNo}")
	public String detail(@PathVariable("fundingNo") int fundingNo
						, Model model) {
		
		FundingDetail detail = service.selectFundingDetail(fundingNo);
		// 맵이 있어야 결제정보(멤버 프로필이미지, 이름, 결제금액, 공개여부) 옮기지..
		// detail에 그냥 같이 넣으까
		
		
		if(detail!=null) { // 펀딩상세조회 성공 시
			model.addAttribute("detail",detail);
		}
		
		return "funding/funding-detail";
	}
	
	
	
	
	
	
	
	// 펀딩 리워드 선택 
	@GetMapping("/reward/{fundingNo}")
	public String rewardSelect() {
		
		// 리워드 넘버 있으면 리워드에 선택됨 표시 어떻게함?
		// 일단 값을 넘겨보자 어떻게든 되겠지
		
		// 로그인 세션 없을때 로그인 화면으로 >> 
		// 로그인 후 리워드 선택 화면으로 되돌아오기??이건 어떻게함. . 로그인쪽에서... 펀딩번호가지고 넘어가기...
		// 펀딩번호 있으면 해당 펀딩번호의 리워드 선택화면으로 오기.하면되겠네.
		
		
		// 로그인 세션 있을때 리워드 선택 화면으로
		return "funding/reward-select";
	}

	// 리워드 선택 -> 결제화면으로
	// 멤버넘버(세션), 펀딩넘버(PathVariable), 리워드 넘버와 수량(input), 이름과 펀딩금액 공개여부(input) ---넘어가야됨 
	
	
}
