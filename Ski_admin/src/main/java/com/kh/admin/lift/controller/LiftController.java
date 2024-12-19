package com.kh.admin.lift.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.admin.lift.model.service.LiftService;
import com.kh.admin.lift.model.vo.Lift;

@Controller
public class LiftController {

	
	@Autowired
	private LiftService liftService;
	
	@GetMapping("liftSelect.li")
	public ModelAndView selectLift(ModelAndView mv) {
		
		ArrayList<Lift> list = liftService.selectLift();
		mv.addObject("list", list).setViewName("lift/liftSelectView");
		return mv;
	}
	
	@GetMapping("updateLiftView.li")
	public ModelAndView updateLiftView(ModelAndView mv) {
		
		ArrayList<Lift> list = liftService.selectLift();
		mv.addObject("list", list).setViewName("lift/liftUpdateView");
		return mv;
	}
	
	@RequestMapping(value = "updateLift.li", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateLift(@RequestParam Map<String, String> paramMap, Model model, HttpSession session) {
		
	    ArrayList<Lift> liftList = new ArrayList<>();
	    int index = 0;
	    while (paramMap.containsKey("li[" + index + "].liftNo")) {
	        Lift lift = new Lift();
	        lift.setLiftNo(Integer.parseInt(paramMap.get("li[" + index + "].liftNo")));
	        lift.setLiftType(paramMap.get("li[" + index + "].liftType"));
	        lift.setLiftAge(paramMap.get("li[" + index + "].liftAge"));
	        lift.setLiftPrice(Integer.parseInt(paramMap.get("li[" + index + "].liftPrice")));

	        liftList.add(lift);
	        index++;
	    }

	    // 서비스 호출하여 업데이트 실행
	    int result = liftService.updateLift(liftList);
	    
	    if(result > 0) {
	    	session.setAttribute("alertMsg", "리프트권 금액 변경 완료");
	    }

	    model.addAttribute("updatedList", liftList);
	    return "redirect:/liftSelect.li";
	}

	
}
