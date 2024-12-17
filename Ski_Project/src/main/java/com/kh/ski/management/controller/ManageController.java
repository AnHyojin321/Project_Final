package com.kh.ski.management.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ManageController {

	@GetMapping("search.map")
	public String myPage() {
		return "management/mapView";
	}
	
}
