package com.kh.ski.locker.controller;

import com.kh.ski.locker.model.service.LockerService;
import com.kh.ski.locker.model.vo.Locker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class LockerController {

    @Autowired
    private LockerService lockerService;

    @GetMapping("/locker")
    public String lockerPage(Model model) {
        // 데이터베이스에서 LOCKER_NO 1~4인 정보를 가져옴
        List<Locker> lockers = lockerService.getAllLockers();
        model.addAttribute("lockers", lockers);
        return "locker/Locker"; // JSP 파일 이름
    }
}
