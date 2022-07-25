package edu.kh.allWeAdopt.point.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.allWeAdopt.member.model.service.MemberServiceImpl;
import edu.kh.allWeAdopt.member.model.vo.Member;
import edu.kh.allWeAdopt.point.model.service.PointService;

@Controller
@RequestMapping("/point")
@SessionAttributes({"loginMember"})
public class Point {
	
	private Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired 
	private PointService service;
	
	
	//워들 페이지로 이동
	@GetMapping("/wordle")
	public String wrdle() {
		//필요할경우 여기서 데이터 꺼내감
		return "point/wordle";
	}
	
	//워들 성공시 포인트를 추가해주는 AJAX
	@ResponseBody
	@GetMapping("/wordle/success")
	public int wordleSuccess(@ModelAttribute("loginMember") Member loginMember) {
		int memberNo=loginMember.getMemberNo();
		int result=service.wordleSuccess(memberNo);
		return result;
	}
	
	
	//룰렛 페이지로 이동
	@GetMapping("/roulette")
	public String roulette() { 
		//필요할 경우 여기서 꺼내감
		return "point/roulette";
	}
	
	

}
