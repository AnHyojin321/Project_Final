package com.kh.ski.main4.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ski.main4.model.service.MService4;

@Controller
public class MController4 {

    @Autowired
    private MService4 mService4;

    @RequestMapping("/main4") 
    public String showMainPage() {
        return "main4";  
    }

    @RequestMapping("/goToMain5")
    public String goToMain5() {
        mService4.processBeforeRedirect(); // 서비스 호출
        return "main/main5";  // /WEB-INF/views/main/main2.jsp로 리다이렉트
    }
}
