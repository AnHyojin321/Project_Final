package com.kh.ski.locker.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ski.locker.model.service.LockerService;
import com.kh.ski.locker.model.vo.Locker;
import com.kh.ski.locker.model.vo.LockerReservation;

@Controller
public class LockerController {

    @Autowired
    private LockerService lockerService;
    
    @PostMapping("storeSessionData.lo")
	@ResponseBody
	public Map<String, String> storeSessionData(
			@RequestParam("lockerNo") String lockerNo,
            @RequestParam("memberNo") String memberNo,
            @RequestParam("lockerStartDate") @DateTimeFormat(pattern = "yyyy-MM-dd") String lockerStartDate,
            @RequestParam("lockerEndDate") @DateTimeFormat(pattern = "yyyy-MM-dd") String lockerEndDate,
            @RequestParam("lockerTotalPrice") String lockerTotalPrice,
	        HttpSession session) {

	    // 세션에 데이터 저장
	    session.setAttribute("lockerNo", lockerNo);
	    session.setAttribute("memberNo", memberNo);
	    session.setAttribute("lockerStartDate", lockerStartDate);
	    session.setAttribute("lockerEndDate", lockerEndDate);
	    session.setAttribute("lockerTotalPrice", lockerTotalPrice);
	    System.out.println("세션에 데이터 저장됨");

	    // 성공 응답 반환
	    Map<String, String> response = new HashMap<>();
	    response.put("status", "success");
	    return response;
	}
	
	@PostMapping("payResult.lo")
	public String payResult(@RequestParam("authResultCode") String authResultCode,
	                        @RequestParam("authResultMsg") String authResultMsg,
	                        @RequestParam("tid") String tid,
	                        HttpSession session,
	                        Model model) {

	    // 세션에서 데이터 가져오기
	    String memberNo = (String) session.getAttribute("memberNo");
	    String lockerNo = (String) session.getAttribute("lockerNo");
	    String lockerStartDate = (String) session.getAttribute("lockerStartDate");
	    String lockerEndDate = (String) session.getAttribute("lockerEndDate");
	    String lockerTotalPrice = (String) session.getAttribute("lockerTotalPrice");

	     System.out.println("세션에서 데이터 가져옴");
	    // 결제 결과 검증
	    if ("0000".equals(authResultCode)) {
	        model.addAttribute("tid", tid);
	        model.addAttribute("memberNo", memberNo);
	        model.addAttribute("lockerNo", lockerNo);
	        model.addAttribute("lockerStartDate", lockerStartDate);
	        model.addAttribute("lockerEndDate", lockerEndDate);
	        model.addAttribute("lockerTotalPrice", lockerTotalPrice);

	        return "locker/autoPostLockForm";
	    } else {
	        model.addAttribute("message", authResultMsg);
	        return "locker/payLockfail";
	    }
	}
	
	@PostMapping("/payConfirm.lo")
    public ModelAndView payConfirm(LockerReservation lr,
    								ModelAndView mv) {

            // 요청된 데이터 출력 (개발 확인용)
            System.out.println("TID: " + lr.getTid());
            System.out.println("Member No: " + lr.getMemberNo());
            System.out.println("Room No: " + lr.getLockerNo());
            System.out.println("Check-In: " + lr.getLockerStartDate());
            System.out.println("Check-Out: " + lr.getLockerEndDate());
            System.out.println("Total Price: " + lr.getLockerTotalPrice());
            
            
            int result = lockerService.insertPayLocker(lr);
            
            if(result > 0) {
            	// 성공 시 결과 페이지로 이동
            	mv.setViewName("locker/payLocksuccess");
            } else {
            	// 오류 발생 시 실패 페이지로 이동
            	mv.setViewName("locker/payLockfail");
            }

        return mv;
    }

    /**
     * 락커 목록 페이지
     */
    @GetMapping("/locker")
    public String lockerPage(org.springframework.ui.Model model) {
        // 데이터베이스에서 모든 락커 정보를 가져와서 뷰에 전달
        List<Locker> lockers = lockerService.getAllLockers();
        model.addAttribute("lockers", lockers);
        return "locker/Locker"; // JSP 파일 이름
    }

    @GetMapping("/lockerDetail.lo")
    @ResponseBody
    public LockerReservation getLockerDetail(@RequestParam("lockerReservNo") int lockerReservNo) {
        LockerReservation lockerReservation = lockerService.findLockerReservationById(lockerReservNo);
        if (lockerReservation != null) {
            System.out.println("조회된 락커 예약 정보: " + lockerReservation);
        } else {
            System.out.println("해당 번호로 락커 예약 정보를 찾을 수 없습니다.");
        }
        return lockerReservation;
    }

}
