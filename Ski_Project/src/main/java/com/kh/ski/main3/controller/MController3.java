package com.kh.ski.main3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ski.main3.model.service.MService3;

@Controller
public class MController3 {

    @Autowired
    private MService3 mService3;

    @RequestMapping("/main3") 
    public String showMainPage() {
        return "main3";  
    }

    @RequestMapping("/goToMain4")
    public String goToMain4() {
        mService3.processBeforeRedirect(); // 서비스 호출
        return "main/main4";  // /WEB-INF/views/main/main2.jsp로 리다이렉트
    }
}
