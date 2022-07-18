package edu.kh.allWeAdopt.funding.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.json.Json;
import javax.json.JsonArray;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.Logger;
import org.json.simple.JSONArray;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import edu.kh.allWeAdopt.common.Util;
import edu.kh.allWeAdopt.funding.model.service.FundingService;
import edu.kh.allWeAdopt.funding.model.vo.Funding;
import edu.kh.allWeAdopt.funding.model.vo.FundingDetail;
import edu.kh.allWeAdopt.funding.model.vo.OrderDetail;
import edu.kh.allWeAdopt.funding.model.vo.Reward;
import edu.kh.allWeAdopt.member.model.vo.Member;




@Controller
@RequestMapping("/admin/funding")
@SessionAttributes({"loginMember"}) 
public class AdminFundingController {
	
	@Autowired
	private FundingService service;

		
	//펀딩 관리 페이지
	@GetMapping("/management")
	public String selectManagementPage(Model model) {
		
		
		// 펀딩 진행중+ 종료된 펀딩
		Map<String, Object> map = service.selectfundingAllList();
		
		// 예정된 펀딩 리스트 가져오기
		List<FundingDetail> sList = service.selectFundingSList();
		map.put("sList", sList);
		
		model.addAttribute("map",map);
		
		

		
		return "funding/admin/funding-management";
	}
	
	//펀딩 등록 페이지
	@GetMapping("/register")
	public String fundingRegister(@RequestParam(value = "fundingNo", required = false, defaultValue="0")int fundingNo
								,Model model) {
		
		
		//수정의 경우
		if(fundingNo>0) {
			FundingDetail detail = service.selectFundingDetail(fundingNo);
			
			//detail.setFundingContent(new Gson().toJson(detail.getFundingContent()));
			
			List<Reward> rewardList  = service.selectRewardList(fundingNo);
			
			model.addAttribute("detail",detail);
			model.addAttribute("rewardList",rewardList);
		}
		
		
		
		
		return "funding/admin/funding-register";
	}
	//펀딩 등록 페이지
	@PostMapping("/register")
	public String fundingRegister(@RequestParam(value = "uploadImage", required = false, defaultValue="0") MultipartFile uploadImage
								 ,@ModelAttribute FundingDetail fundingDetail
								 ,String insertRewardList
								 ,String mode
								 ,@RequestParam(value = "fundingNo", required = false, defaultValue="0") int fundingNo
								 ,HttpServletRequest req, RedirectAttributes ra
									)throws Exception {
								
		
		
			String json = insertRewardList;
			String arr[] = json.split("-");
			Gson gson = new Gson();
			List<Reward> rewardList = new ArrayList<Reward>();
			
			for(String temp : arr) {
				Reward r = gson.fromJson(temp, Reward.class);
				r.setFundingNo(fundingNo);//최초 생성시에는 0 , 업데이트일때는 자동으로 펀딩 번호 넣어짐	
				rewardList.add(r);
			}
			
			
		//썸네일 저장하기
		String webPath = "/resources/images/fundingThumbnail/";
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);
			
		//리스트 형태로 가공한 데이터 DB에 저장하기	
		fundingDetail.setRewardList(rewardList);
		
		
		
		
		if(mode.equals("update")) {
			fundingDetail.setFundingNo(fundingNo);
			int result = service.fundingUpdate(fundingDetail,uploadImage,webPath,folderPath);
			if(result>0) {
				ra.addFlashAttribute("massage","성공적으로 수정 되었습니다.");
				return "redirect:management";
			}
		}
		
		if(mode.equals("insert")) {
			fundingNo = service.fundingRegister(fundingDetail,uploadImage,webPath,folderPath);
			if(fundingNo>0) {
				ra.addFlashAttribute("massage","성공적으로 등록되었습니다.");
				//펀딩 상세 보기 페이지로 리다이렉트 하기.
				return "redirect:management";
			}
		}
		

		
		
		return null;
	}
	
	//배송 관리 페이지.
	@GetMapping("/delivery")
	public String deliveryController() {
		return "funding/admin/delivery-controller";
	}
	
	
	
	
}
