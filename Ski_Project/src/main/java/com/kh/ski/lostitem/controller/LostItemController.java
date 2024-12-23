package com.kh.ski.lostitem.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.ski.common.model.vo.PageInfo;
import com.kh.ski.common.template.Pagination;
import com.kh.ski.lostitem.model.service.LostItemService;
import com.kh.ski.lostitem.model.vo.LostItem;

@Controller
public class LostItemController {

    @Autowired
    private LostItemService lostItemService;

    /**
     * 분실물 게시판 목록 조회
     */
    @GetMapping("/lostList")
    public String selectLostList(
            @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
            @RequestParam(value = "startDate", required = false) String startDate,
            @RequestParam(value = "endDate", required = false) String endDate,
            @RequestParam(value = "location", required = false) String location,
            Model model) {
        
        Map<String, Object> filterMap = new HashMap<>();
        if (startDate != null && !startDate.isEmpty()) filterMap.put("startDate", startDate);
        if (endDate != null && !endDate.isEmpty()) filterMap.put("endDate", endDate);
        if (location != null && !location.isEmpty()) filterMap.put("location", location);
        
        System.out.println("Filter Map: " + filterMap); // 디버깅 출력

        int listCount = lostItemService.selectFilteredListCount(filterMap);
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);

        filterMap.put("startRow", (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
        filterMap.put("endRow", pi.getCurrentPage() * pi.getBoardLimit());

        List<LostItem> list = lostItemService.selectFilteredLostList(filterMap);

        System.out.println("Retrieved List: " + list); // 디버깅 출력

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        model.addAttribute("filter", filterMap);

        return "lostitem/LostList";
    }

    /**
     * 분실물 상세보기
     */
    @GetMapping("/lostItemDetail")
    public String selectLostItemDetail(@RequestParam("lostNo") int lostNo, Model model) {
        LostItem lostItem = lostItemService.selectLostItemDetail(lostNo);
        model.addAttribute("lostItem", lostItem);
        return "lostitem/LostItemDetail"; // 상세보기 JSP 경로
    }

    /**
     * 분실물 상태 확인 페이지
     */
    @GetMapping("/lostItemStatus")
    public String checkLostItemStatus(@RequestParam("lostNo") int lostNo, Model model) {
        LostItem lostItem = lostItemService.selectLostItemDetail(lostNo);

        model.addAttribute("lostItem", lostItem);
        return "lostitem/userLostItemStatus"; // 분실물 상태 확인 JSP
    }
}
