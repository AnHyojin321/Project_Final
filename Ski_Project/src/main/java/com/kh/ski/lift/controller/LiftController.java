package com.kh.ski.lift.controller;

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

import com.kh.ski.lift.model.service.LiftService;
import com.kh.ski.lift.model.vo.Lift;
import com.kh.ski.lift.model.vo.LiftOrder;

@Controller
public class LiftController {

	@Autowired
	private LiftService liftService;
	
	// 리프트권 조회 controller
	@GetMapping("liftList.li")
	public ModelAndView selectLiftList(ModelAndView mv) {
		mv.setViewName("lift/liftFirstPage");
		return mv;
	}
	
	// 일일권 상세 조회
	@GetMapping("dayPass.li")
	public ModelAndView selectDayPass(ModelAndView mv) {
		ArrayList<Lift> dayPass = liftService.selectDayPass();
		mv.addObject("dayPass", dayPass).setViewName("lift/dayPass");
		return mv;
	}
	
	// 시즌권 상세 조회
	@GetMapping("seasonPass.li")
	public ModelAndView selectSeasonPass(ModelAndView mv) {
		ArrayList<Lift> seasonPass = liftService.selectSeasonPass();
		mv.addObject("seasonPass", seasonPass).setViewName("lift/seasonPass");
		return mv;
	}
	
	
	// 리프트권 주문 Controller
	@RequestMapping(value = "liftOrder.li", method = {RequestMethod.GET, RequestMethod.POST})
	public String liftOrder(@RequestParam Map<String, String> paramMap, Model model, HttpSession session) {
	    ArrayList<LiftOrder> liftOrderList = new ArrayList<>();
	    
	    // 인덱스를 기반으로 객체를 수동으로 생성
	    int index = 0;
	    while (paramMap.containsKey("li[" + index + "].liftNo")) {
	        LiftOrder liftOrder = new LiftOrder();
	        liftOrder.setLiftNo(Integer.parseInt(paramMap.get("li[" + index + "].liftNo")));
	        liftOrder.setLiftCount(Integer.parseInt(paramMap.get("li[" + index + "].liftCount")));
	        liftOrder.setLiftTotalPrice(Integer.parseInt(paramMap.get("li[" + index + "].liftTotalPrice")));
	        liftOrder.setMemberNo(Integer.parseInt(paramMap.get("li[" + index + "].memberNo")));

	        liftOrderList.add(liftOrder);
	        index++;
	        
	    }
	    
	    int result = 0;
	    for (LiftOrder liftOrder : liftOrderList) {
	        int orderResult = liftService.liftOrder(liftOrder);
	        result += orderResult;
	    }
	    
	    model.addAttribute("updatedList", liftOrderList);
	    return "redirect:/liftList.li";
	}
	
}
