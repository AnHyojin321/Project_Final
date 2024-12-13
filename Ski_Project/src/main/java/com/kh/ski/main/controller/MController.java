package com.kh.ski.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ski.main.model.service.MService;

@Controller
public class MController {

    @Autowired
    private MService mService;

    @RequestMapping("/main") 
    public String showMainPage() {
        return "main";  
    }

    @RequestMapping("/goToMain2")
    public String goToMain2() {
        mService.processBeforeRedirect(); // 서비스 호출
        return "main/main2";  // /WEB-INF/views/main/main2.jsp로 리다이렉트
    }
}
