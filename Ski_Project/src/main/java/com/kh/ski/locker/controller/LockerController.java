package com.kh.ski.locker.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.ski.locker.model.service.LockerService;
import com.kh.ski.locker.model.vo.Locker;

@Controller
public class LockerController {

    @Autowired
    private LockerService lockerService;

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

    /**
     * 락커 예약 처리 (AJAX 요청)
     */
    @PostMapping("/lockerReserve")
    public ResponseEntity<Map<String, Object>> reserveLocker(
            @RequestParam("lockerNo") int lockerNo,
            @RequestParam("memberNo") int memberNo,
            @RequestParam("startDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
            @RequestParam("endDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate) {

        Map<String, Object> response = new HashMap<>();
        System.out.println("===== 예약 요청 확인 =====");
        System.out.println("LockerNo: " + lockerNo);
        System.out.println("MemberNo: " + memberNo);
        System.out.println("StartDate: " + startDate);
        System.out.println("EndDate: " + endDate);

        try {
            boolean isReserved = lockerService.reserveLocker(lockerNo, memberNo, startDate, endDate);
            
            if (isReserved) {
                response.put("success", true);
                response.put("message", "락커 예약이 성공적으로 완료되었습니다.");
            } else {
                response.put("success", false);
                response.put("message", "락커 예약에 실패했습니다.");
            }

        } catch (Exception e) {
            e.printStackTrace(); // 오류 출력
            response.put("success", false);
            response.put("message", "서버 처리 중 오류가 발생했습니다: " + e.getMessage());
        }

        return ResponseEntity.ok(response);
    }

}
