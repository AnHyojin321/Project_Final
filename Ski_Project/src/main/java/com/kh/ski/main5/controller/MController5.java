package com.kh.ski.main5.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ski.main5.model.service.MService5;

@Controller
public class MController5 {

    @Autowired
    private MService5 mService5;

    @RequestMapping("/main5") 
    public String showMainPage() {
        return "main5";  
    }

    @RequestMapping("/goToMain6")
    public String goToMain6() {
        mService5.processBeforeRedirect(); // 서비스 호출
        return "main/main6";  // /WEB-INF/views/main/main2.jsp로 리다이렉트
    }
}
