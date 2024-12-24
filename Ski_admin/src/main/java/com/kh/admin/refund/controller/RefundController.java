package com.kh.admin.refund.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.admin.refund.model.service.RefundService;

@Controller
@RequestMapping("/refund")
public class RefundController {

    @Autowired
    private RefundService refundService;

    // 기본 환불 페이지
    @GetMapping
    public String showRefundPage(Model model) {
        return "refund/refund"; // 기본 JSP 경로 반환
    }

    // 공통 검색 API
    @GetMapping("/search")
    public ResponseEntity<Map<String, Object>> searchRefundItems(@RequestParam("category") String category) {
        List<Map<String, Object>> rows = new ArrayList<>();
        List<String> columns = new ArrayList<>();

        switch (category) {
            case "locker":
                rows = refundService.getLockerRefundItems();
                columns = List.of(
                    "lockerReservNo", "lockerStartDate", "lockerEndDate", 
                    "totalPrice", "tid", "usedStatus", "refundStatus", 
                    "refundDate", "memberNo", "lockerNo"
                );
                break;
            case "package":
                rows = refundService.getPackageRefundItems();
                columns = List.of(
                    "packageReservNo", "checkInDate", "checkOutDate", 
                    "tid", "refundStatus", "refundDate", "memberNo", "packageNo"
                );
                break;
            case "lift":
                rows = refundService.getLiftRefundItems();
                columns = List.of(
                    "liftPurchaseNo", "purchaseDate", "usedStatus", 
                    "totalPrice", "totalCount", "tid", "memberId", "refundStatus"
                );
                break;
            case "room":
                rows = refundService.getRoomRefundItems();
                columns = List.of(
                    "roomReservNo", "amount", "checkInDate", 
                    "checkOutDate", "reservDate", "tid", 
                    "payStatus", "packageNo", "usedStatus", 
                    "refundStatus", "refundDate", "memberNo", "roomNo"
                );
                break;
            default:
                throw new IllegalArgumentException("Unknown category: " + category);
        }

        Map<String, Object> response = new HashMap<>();
        response.put("columns", columns);
        response.put("rows", rows);

        return ResponseEntity.ok(response);
    }

    // 데이터 키를 소문자로 변환
    public List<Map<String, Object>> normalizeKeys(List<Map<String, Object>> rows) {
        return rows.stream().map(row -> {
            Map<String, Object> normalized = new HashMap<>();
            row.forEach((key, value) -> normalized.put(key.toLowerCase(), value));
            return normalized;
        }).collect(Collectors.toList());
    }

    @GetMapping("/lockerRefund")
    public String getLockerRefund(Model model) {
        List<Map<String, Object>> lockerRefundList = refundService.getLockerRefundItems();
        System.out.println("Locker Refund List: " + lockerRefundList); // 로그로 데이터 확인
        model.addAttribute("lockerRefundList", lockerRefundList);
        return "refund/lockerRefund"; 
    }


    // 패키지 환불 목록 조회
    @GetMapping("/packageRefund")
    public String getPackageRefund(Model model) {
        List<Map<String, Object>> packageRefundList = refundService.getPackageRefundItems();
        System.out.println("packageRefundList: " + packageRefundList); // 로그로 데이터 확인
        model.addAttribute("packageRefundList", packageRefundList);
        return "refund/packageRefund"; 
    }

    // 리프트권 환불 목록 조회
    @GetMapping("/liftRefund")
    public String getLiftRefund(Model model) {
        List<Map<String, Object>> liftRefundList = refundService.getLiftRefundItems();
        System.out.println("liftRefundList: " + liftRefundList); // 로그로 데이터 확인
        model.addAttribute("liftRefundList", liftRefundList);
        return "refund/liftRefund"; 
    }

    // 객실 환불 목록 조회
    @GetMapping("/roomRefund")
    public String getRoomRefund(Model model) {
        List<Map<String, Object>> roomRefundList = refundService.getRoomRefundItems();
        System.out.println("roomRefundList: " + roomRefundList); // 로그로 데이터 확인
        model.addAttribute("roomRefundList", roomRefundList);
        return "refund/roomRefund"; 
    }

}
