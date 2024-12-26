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

  
}
