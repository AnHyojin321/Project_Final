package com.kh.ski.main6.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ski.main6.model.service.MService6;

@Controller
public class MController6 {

    @Autowired
    private MService6 mService6;

    @RequestMapping("/main6") 
    public String showMainPage() {
        return "main6";  
    }

    @RequestMapping("/goToMain7")
    public String goToMain6() {
        mService6.processBeforeRedirect(); // 서비스 호출
        return "main/main6";  // /WEB-INF/views/main/main2.jsp로 리다이렉트
    }
}
