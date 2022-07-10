package edu.kh.allWeAdopt.findHospital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/findHospital")
public class FindHospitalController {

	@GetMapping
	public String findHospital() {
		return "findHospital/findHospital";
	}
}
