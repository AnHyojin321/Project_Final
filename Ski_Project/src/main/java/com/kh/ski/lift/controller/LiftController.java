package com.kh.ski.lift.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ski.lift.model.service.LiftService;
import com.kh.ski.lift.model.vo.Lift;
import com.kh.ski.lift.model.vo.LiftOrder;
import com.kh.ski.lift.model.vo.LiftPay;
import com.kh.ski.member.model.vo.Member;

@Controller
public class LiftController {

	@Autowired
	private LiftService liftService;
	

	
	
	/**
	 * 리프트 결제 관련 컨트롤러 
	 * @param roomNo
	 * @param checkInDate
	 * @param checkOutDate
	 * @param amount
	 * @param session
	 * @return
	 */
	@PostMapping("storeSessionData.li")
	@ResponseBody
	public Map<String, String> storeSessionData(
	        @RequestParam("memberId") String memberId,
	        @RequestParam("totalCount") String totalCount,
	        @RequestParam("totalPrice") String totalPrice,
	        HttpSession session) {

	    // 세션에 데이터 저장
	    session.setAttribute("memberId", memberId);
	    session.setAttribute("totalCount", totalCount);
	    session.setAttribute("totalPrice", totalPrice);
	    System.out.println("세션에 담긴 아이디 : " + memberId);



	    // 성공 응답 반환
	    Map<String, String> response = new HashMap<>();
	    response.put("status", "success");
	    return response;
	}
	
	@PostMapping("payResult.li")
	public String payResult(@RequestParam("authResultCode") String authResultCode,
	                        @RequestParam("authResultMsg") String authResultMsg,
	                        @RequestParam("tid") String tid,
	                        HttpSession session,
	                        Model model) {

	    // 세션에서 데이터 가져오기
	    String memberId = (String) session.getAttribute("memberId");
	    String totalCount = (String) session.getAttribute("totalCount");
	    String totalPrice = (String) session.getAttribute("totalPrice");
	    
	    System.out.println("세션에서 꺼내온 아이디 : " + memberId);

	    // 결제 결과 검증
	    if ("0000".equals(authResultCode)) {
	        model.addAttribute("tid", tid);
	        model.addAttribute("memberId", memberId);
	        model.addAttribute("totalCount", totalCount);
	        model.addAttribute("totalPrice", totalPrice);


	        return "lift/autoPostLiftForm";
	    } else {
	        model.addAttribute("message", authResultMsg);
	        return "lift/payLiftfail";
	    }
	}
	
	@PostMapping("/payConfirm.li")
    public ModelAndView payConfirm(LiftPay lp,
    								ModelAndView mv) {

            // 요청된 데이터 출력 (개발 확인용)
            System.out.println("TID: " + lp.getTid());
            System.out.println("Member id: " + lp.getMemberId());
            System.out.println("구매한 리프트 전체 갯수: " + lp.getTotalCount());
            System.out.println("구매한 피프트 전체 가격: " + lp.getTotalPrice());


            int result = liftService.insertLiftPay(lp);

            System.out.println("result : " + result);
            if(result > 0) {
            	// 성공 시 결과 페이지로 이동
            	mv.setViewName("lift/payLiftsuccess");
            } else {
            	// 오류 발생 시 실패 페이지로 이동
            	mv.setViewName("lift/payLiftfail");
            }
          

        return mv;
    }
	// 여기까지 리프트 결제 관련
	

	
	
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
		System.out.println("dayPass : " + dayPass);
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
	public String liftOrder(
	        @RequestParam("liftNo") List<Integer> liftNo,
	        @RequestParam("liftCount") List<Integer> liftCount,
	        @RequestParam("liftTotalPrice") List<Integer> liftTotalPrice,
	        @RequestParam("memberId") List<String> memberId,
	        Model model, HttpSession session) {

	    // LiftOrder 리스트 생성
	    List<LiftOrder> liftOrderList = new ArrayList<>();

	    // 데이터를 리스트에 추가
	    for (int i = 0; i < liftNo.size(); i++) {
	        LiftOrder liftOrder = new LiftOrder();
	        liftOrder.setLiftNo(liftNo.get(i));
	        liftOrder.setLiftCount(liftCount.get(i));
	        liftOrder.setLiftTotalPrice(liftTotalPrice.get(i));
	        liftOrder.setMemberId(memberId.get(i));
	        liftOrderList.add(liftOrder);
	    }

	    // 데이터 출력 확인
	    liftOrderList.forEach(order -> {
	        System.out.println("Lift No: " + order.getLiftNo());
	        System.out.println("Lift Count: " + order.getLiftCount());
	        System.out.println("Lift Total Price: " + order.getLiftTotalPrice());
	        System.out.println("Member ID: " + order.getMemberId());
	    });

	    // 데이터베이스 저장 로직
	    int result = 0;
	    for (LiftOrder liftOrder : liftOrderList) {
	        int orderResult = liftService.liftOrder(liftOrder); // INSERT 수행
	        result += orderResult;
	    }

	    // 결과 확인
	    if (result == liftOrderList.size()) {
	        System.out.println("모든 데이터 저장 성공!");
	    } else {
	        System.out.println("일부 데이터 저장 실패");
	    }

	    // 저장된 리스트를 모델에 추가
	    model.addAttribute("list", liftOrderList);

	    // 결과를 보여줄 JSP 페이지로 이동
	    return "lift/liftPayInfo";
	}

// 김동준 마이페이지
	@GetMapping("/liftOrderDetail.li")
	@ResponseBody
	public Map<String, Object> liftOrderDetail(@RequestParam("liftOrderNo") int liftOrderNo) {
	    LiftOrder liftOrder = liftService.selectLiftOrderByNo(liftOrderNo); // DAO 또는 Service에서 구현
	    Map<String, Object> response = new HashMap<>();

	    if (liftOrder != null) {
	        response.put("liftOrderNo", liftOrder.getLiftOrderNo());
	        response.put("liftNo", liftOrder.getLiftNo());
	        response.put("liftCount", liftOrder.getLiftCount());
	        response.put("liftTotalPrice", liftOrder.getLiftTotalPrice());
	    }

	    return response;
	}
	
	
	@GetMapping("myLift.me")
	public ModelAndView selectPurchasedLiftList(HttpSession session, ModelAndView mv) {
		
		Member loginMember = (Member)session.getAttribute("loginMember");
	    
	    String memberId = loginMember.getMemberId();
	    
	    Member m = liftService.selectMember(memberId);
	    ArrayList<LiftPay> list = liftService.selectPurchasedLiftList(memberId);
	    
	    mv.addObject("m", m)
	      .addObject("list", list)
	  	  .setViewName("mypage/myLift");
	    System.out.println(list);

		return mv;
	}
	
	// 예약 취소 처리 요청 컨트롤러
	@RequestMapping(value = "canclePurchase.me", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String cancelLiftPurchase(@RequestParam("liftPurchaseNo") int liftPurchaseNo) {
		System.out.println("환불하고자하는 예약 번호 : " + liftPurchaseNo);
		
		int result = liftService.cancelLiftPurchase(liftPurchaseNo);
		
	    if (result > 0) { 
	        System.out.println("환불 성공");
	        return "success";
	    } else {
	        System.out.println("환불 실패");
	        return "fail";
	    }
	}
	
	
	// QRCode 발급 컨트롤러
	@RequestMapping(value = "qrCode.me", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String QRCode(@RequestParam("liftPurchaseNo") int liftPurchaseNo) {
		
		int result = liftService.QRCode(liftPurchaseNo);
		
		if (result > 0) { 
			System.out.println("환불 성공");
			return "success";
		} else {
			System.out.println("환불 실패");
			return "fail";
		}
	}



 
}
