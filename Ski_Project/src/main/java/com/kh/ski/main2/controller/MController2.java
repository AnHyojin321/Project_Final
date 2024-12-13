package com.kh.ski.main2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ski.main2.model.service.MService2;

@Controller
public class MController2 {

    @Autowired
    private MService2 mService2;

    @RequestMapping("/main2") 
    public String showMainPage() {
        return "main2";  
    }

    @RequestMapping("/goToMain3")
    public String goToMain3() {
        mService2.processBeforeRedirect(); // 서비스 호출
        return "main/main3";  // /WEB-INF/views/main/main2.jsp로 리다이렉트
    }
}
