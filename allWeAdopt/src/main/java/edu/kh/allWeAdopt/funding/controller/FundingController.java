package edu.kh.allWeAdopt.funding.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.kh.allWeAdopt.funding.model.service.FundingService;
import edu.kh.allWeAdopt.funding.model.vo.FundingDetail;
import edu.kh.allWeAdopt.funding.model.vo.Reward;

@Controller
@RequestMapping("/funding")
public class FundingController {
	
	@Autowired
	private FundingService service;

	// 펀딩 리스트 조회
	@GetMapping("/list")
	public String list(Model model) {
		
		// 모든 펀딩 리스트 조회
		Map<String, Object> map = service.selectfundingAllList();
		
		model.addAttribute("map",map);
		
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
	public String rewardSelect(@PathVariable("fundingNo") int fundingNo
								,Model model
								,@RequestParam(value="selected", required=false) String selected) {
		
		// 리워드정보 + 리워드 결제정보 조회
		Map<String, Object> map = service.selectReward(fundingNo);

		// 펀딩넘버
		if(fundingNo!=0) {
			map.put("fundingNo", fundingNo);
		}
		
		// 순차발송 날짜 구하기
		DecimalFormat df = new DecimalFormat("00");
        Calendar currentCalendar = Calendar.getInstance();
        //이번해
        String year  = df.format(currentCalendar.get(Calendar.YEAR) + 1);
        //이번달
        String month  = df.format(currentCalendar.get(Calendar.MONTH) + 1);
		String sendDate = year+"년 "+month+"월 1일";
		map.put("sendDate", sendDate);
        
		
		//선택한 리워드 넘버
		if(selected!="") {// 리워드 선택하고 넘어왔을때
			// 선택한 리워드넘버
			map.put("selected", selected);
		}
		
		// 세션에 map저장
		model.addAttribute("map",map);

		return "funding/reward-select";
	}


	
}
