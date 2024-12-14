package com.kh.ski.lift.controller;

import java.util.ArrayList;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
		mv.setViewName("lift/dayPass");
		return mv;
	}
	
	// 시즌권 상세 조회
	@GetMapping("seasonPass.li")
	public ModelAndView selectSeasonPass(ModelAndView mv) {
		mv.setViewName("lift/seasonPass");
		return mv;
	}
	
	// 리프트권 주문 ajax controller
	@ResponseBody
	@RequestMapping(value="liftOrderAjax.li", produces="application/json; charset=UTF-8")
	public String liftOrderAjax(int liftOrderNo, String liftType, int count, int totalPrice) {
		
		JSONObject jObj = new JSONObject();
		jObj.put("liftOrderNo", liftOrderNo);
		jObj.put("liftType", liftType);
		jObj.put("count", count);
		jObj.put("totalPrice", totalPrice);
		
		return jObj.toJSONString();
	}
	
	// 리프트권 주문 controller
	@PostMapping("liftOrder.li")
	public ModelAndView liftOrder(@PathVariable("liftOrderNo") int liftOrderNo, ModelAndView mv) {
		
		// 리프트권 주문 상세 정보 조회
		LiftOrder liftOrder = liftService.liftOrder(liftOrderNo);
		
		// ModelAndView에 담기
		mv.addObject("liftOrder", liftOrder).setViewName("lift/liftOrderView");
		return mv;
		
	}
	
	
	
}
