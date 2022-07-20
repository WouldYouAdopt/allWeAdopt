package edu.kh.allWeAdopt.funding.controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
		
		
		try {
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		// 날짜 표현 형식 지정 (년도와 월만 필요함)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		// 현재 날짜 가져오기
        Calendar cal = Calendar.getInstance();
        
        // 다음달 구해서
        cal.add(Calendar.MONTH, 1); 
        // String으로 날짜 출력하기
        String date1 = sdf.format(cal.getTime());
        
        // 한달 더 더함(두달뒤)
        cal.add(Calendar.MONTH, 1); 
        String date2 = sdf.format(cal.getTime());
        
        // 한달 더 더함 (세달뒤)
        cal.add(Calendar.MONTH, 1); 
        String date3 = sdf.format(cal.getTime());
        
        String nextSeason[] = new String[3];
        // season형식 맞추기 2022/08
        nextSeason[0] = date1.substring(0, 4) +"/"+ date1.substring(4, 6);
        nextSeason[1] = date2.substring(0, 4) +"/"+ date2.substring(4, 6);
        nextSeason[2] = date3.substring(0, 4) +"/"+ date3.substring(4, 6);    
        
        // map에 바로 넣어서 가자
		map.put("nextSeason", nextSeason);
		
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
		return "redirect:management";

	}
		
	
	@GetMapping("/select")
	public String selectFundingDetail(int fundingNo
									,Model model) {
		
		FundingDetail detail = service.selectFundingDetail(fundingNo);
		
		model.addAttribute("detail", detail);
		
		return "funding/admin/funding-select";
	}
	
	
	//배송 관리 페이지.
	@GetMapping("/delivery/{fundingNo}/{orderCode}")
	public String deliveryController(@PathVariable int fundingNo
								 	,@PathVariable int orderCode
								 	,Model model) {
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fundingNo", fundingNo);
		map.put("orderCode", orderCode);
		List<OrderDetail> orderList = service.selectOrderList(map);
		model.addAttribute("orderList", orderList);
		
		
		return "funding/admin/delivery-controller";
	}
	
	
	
	
	@ResponseBody
	@GetMapping("/delivery/processing")
	public String processing(int code,String list ,int fundingNo,int orderCode) {
		

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("orderCode", orderCode);
		map.put("fundingNo",fundingNo);
		map.put("list",list);
		map.put("code",code);
		
		int result = service.deliveryProcession(map);
		List<OrderDetail> orderList = service.selectOrderList(map);		
		
		return new Gson().toJson(orderList);
	}
	
	@ResponseBody
	@GetMapping("/delivery/return/processing")
	public String returnProcessing(@RequestParam Map<String,Object> paramMap) {
		
		System.out.println(paramMap);
		return new Gson().toJson(paramMap);
	}
	
	
	
	
	
	//배송 관리 상세 페이지
	@GetMapping("/delivery/detail/{paymentNo}")
	public String selectDeliveryDetail(@PathVariable int paymentNo
										,Model model
										,RedirectAttributes ra) {
		
		OrderDetail detail = service.selectOrderDetail(paymentNo);
		
		if(detail != null) {
			model.addAttribute("detail", detail);
		}else{
			ra.addFlashAttribute("message", "조회중 오류가 발생했습니다.");
			return "redirect:/";
		}
		
		return "funding/my-funding-detail";
	}
	
	
}
