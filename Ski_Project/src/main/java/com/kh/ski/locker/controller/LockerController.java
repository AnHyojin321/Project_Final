package com.kh.ski.locker.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ski.locker.model.service.LockerService;
import com.kh.ski.locker.model.vo.Locker;
import com.kh.ski.locker.model.vo.LockerReservation;
import com.kh.ski.member.model.vo.Member;

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
        

        if (result > 0) {
        	System.out.println(lr.getPayDate());
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
    public String lockerPage(Model model) {
        // 데이터베이스에서 모든 락커 정보를 가져와서 뷰에 전달
        List<Locker> lockers = lockerService.getAllLockers();
        model.addAttribute("lockers", lockers);
        return "locker/Locker"; // JSP 파일 이름
    }


    /**
     * 내 락커 예약 정보 확인 페이지
     */
    @GetMapping("/myLockerReservation")
    public String myLockerReservations(HttpSession session, Model model) {
        // 세션에서 loginMember 객체 확인
        Member loginMember = (Member) session.getAttribute("loginMember");

        if (loginMember == null) {
            System.out.println("로그인하지 않은 사용자입니다.");
            return "redirect:/login.me";
        }

        int memberNo = loginMember.getMemberNo(); // memberNo 가져오기
        System.out.println("memberNo: " + memberNo);

        // 예약 정보 가져오기
        List<LockerReservation> reservations = lockerService.getReservationsByMemberNo(memberNo);
        model.addAttribute("reservations", reservations);

        return "locker/myLockerReservation"; // JSP 파일 이름
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
    
    @PostMapping("/cancelLockerReservation")
    @ResponseBody
    public Map<String, String> cancelLockerReservation(@RequestParam("lockerReservNo") int lockerReservNo) {
        Map<String, String> response = new HashMap<>();
        System.out.println("[DEBUG] 받은 lockerReservNo: " + lockerReservNo); // 로그 추가
        try {
            int result = lockerService.updateRefundStatus(lockerReservNo);
            System.out.println("[DEBUG] updateRefundStatus 결과: " + result); // 로그 추가
            if (result > 0) {
                response.put("status", "success");
                response.put("message", "예약이 성공적으로 취소되었습니다.");
            } else {
                response.put("status", "fail");
                response.put("message", "예약 취소에 실패했습니다."); // 이 부분 실행
            }
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "서버 오류 발생: " + e.getMessage());
            e.printStackTrace();
        }
        return response;
    }


}
