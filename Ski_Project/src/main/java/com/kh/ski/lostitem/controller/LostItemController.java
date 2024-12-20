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
            Model model) {

        // 1. 총 게시글 수 조회
        int listCount = lostItemService.selectListCount();

        // 2. 페이징 정보 계산
        int pageLimit = 5;   // 하단 페이지 번호 최대 개수
        int boardLimit = 10; // 한 페이지에 표시할 게시글 수
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

        // 3. 페이징에 맞는 게시글 목록 조회
        Map<String, Integer> paramMap = new HashMap<>();
        paramMap.put("startRow", (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
        paramMap.put("endRow", pi.getCurrentPage() * pi.getBoardLimit());
        List<LostItem> list = lostItemService.selectLostListPaging(paramMap);
        
        
        // 4. 조회 결과와 페이징 정보 JSP에 전달
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);

        return "lostitem/LostList"; // 게시물 목록 JSP
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
