package com.kh.ski.common.controlelr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ski.common.model.service.MenuService;

@Controller
public class MenuController {

    @Autowired
    private MenuService MenuService;  // 서비스 계층 주입

    @RequestMapping("/menu/showMenubar")
    public String showMenubar() {
    	MenuService.processBeforeRedirect();  // 메뉴 바를 보여주기 전에 서비스 호출
        return "common/menubar";  // /WEB-INF/views/main/menubar.jsp로 이동
    }
}