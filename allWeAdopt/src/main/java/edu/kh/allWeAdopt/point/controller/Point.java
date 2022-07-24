package edu.kh.allWeAdopt.point.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/point")
@SessionAttributes({"loginMember"})
public class Point {
	
	@GetMapping("/wordle")
	public String wrdle() { 
		return "point/wordle";
	}
	@GetMapping("/roulette")
	public String roulette() { 
		return "point/roulette";
	}

}
