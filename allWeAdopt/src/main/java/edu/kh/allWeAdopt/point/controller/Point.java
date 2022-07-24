package edu.kh.allWeAdopt.point.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/point")
@SessionAttributes({"loginMember"})
public class Point {
	
	//워들 페이지로 이동
	@GetMapping("/wordle")
	public String wrdle() {
		//필요할경우 여기서 데이터 꺼내감
		return "point/wordle";
	}
	
	
	//룰렛 페이지로 이동
	@GetMapping("/roulette")
	public String roulette() { 
		//필요할 경우 여기서 꺼내감
		return "point/roulette";
	}
	

}
