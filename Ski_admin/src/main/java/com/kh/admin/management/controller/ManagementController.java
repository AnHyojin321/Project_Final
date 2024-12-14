package com.kh.admin.management.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.admin.management.model.service.ManagementService;
import com.kh.admin.management.model.vo.SkiResortOpen;
import com.kh.admin.management.model.vo.SlopeOpen;

@Controller
public class ManagementController {
	
	@Autowired
	private ManagementService managementService;
	
	@GetMapping("skiResortUpdate.sm")
	public ModelAndView selectSkiResort(ModelAndView mv) {
		
		ArrayList<SkiResortOpen> list = managementService.selectSkiResort();
		mv.addObject("list", list).setViewName("management/skiResortUpdate");
		return mv;
	}
	
	@GetMapping("slopeUpdate.sm")
	public ModelAndView selectSlope(ModelAndView mv) {
		
		ArrayList<SlopeOpen> list = managementService.selectSlope();
		mv.addObject("list", list).setViewName("management/slopeUpdate");
		return mv;
	}
	
	@RequestMapping(value="skiResortUpdateControl.sm", method={RequestMethod.GET, RequestMethod.POST})
	public String updateSkiResort(SkiResortOpen sro) {
		
	    int result = managementService.updateSkiResort(sro);
	    return "redirect:/skiResortUpdate.sm";
	}
	
	@RequestMapping(value = "slopeUpdateControl.sm", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateSlopes(@ModelAttribute ArrayList<SlopeOpen> so) {
		int result = 0;
	    for (SlopeOpen s : so) {
	        result += managementService.updateSlope(so);
	    }
	    System.out.println(result);
	    return "redirect:/slopeUpdate.sm";
	}
	
}
