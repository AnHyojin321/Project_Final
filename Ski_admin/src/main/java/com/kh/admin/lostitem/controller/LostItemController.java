package com.kh.admin.lostitem.controller;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.admin.common.template.Pagination;
import com.kh.admin.lostitem.model.service.LostItemService;
import com.kh.admin.lostitem.model.vo.LostItem;
import com.kh.admin.common.model.vo.PageInfo;

@Controller
public class LostItemController {

    @Autowired
    private LostItemService lostItemService;

    @GetMapping("/lostItemForm")
    public String lostItemForm() {
        return "lostitem/LostItemForm"; 
    }

    @PostMapping("/insertLostItem")
    public String insertLostItem(
            @RequestParam("lostTitle") String lostTitle,
            @RequestParam("lostLocation") String lostLocation,
            @RequestParam("lostContent") String lostContent,
            Model model) {

        LostItem lostItem = new LostItem();
        lostItem.setLostTitle(lostTitle);
        lostItem.setLostLocation(lostLocation);
        lostItem.setLostContent(lostContent);

        int result = lostItemService.insertLostItem(lostItem);

        if (result > 0) {
            model.addAttribute("msg", "분실물이 성공적으로 등록되었습니다.");
            return "redirect:/lostList"; // 성공 시 게시물 목록으로 리다이렉트
        } else {
            model.addAttribute("msg", "분실물 등록에 실패했습니다.");
            return "redirect:/lostItemForm"; // 실패 시 등록 폼으로 리다이렉트
        }

    }
    
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
    
    @GetMapping("/lostItemDetail")
    public String selectLostItemDetail(@RequestParam("lostNo") int lostNo, Model model) {
        
        lostItemService.increaseViewCount(lostNo);

    	// 1. 게시글 정보 조회
        LostItem lostItem = lostItemService.selectLostItemDetail(lostNo);
        
        // 2. 조회된 게시글 정보를 모델에 추가
        model.addAttribute("lostItem", lostItem);

        // 3. 상세보기 페이지로 이동
        return "lostitem/LostItemDetail"; // JSP 경로
    }
    
    @Autowired
    private ServletContext servletContext;

    @PostMapping("/uploadImage")
    @ResponseBody
    public Map<String, String> uploadImage(@RequestParam("file") MultipartFile file) {
        Map<String, String> response = new HashMap<>();
        try {
            // 파일 저장 경로 설정
            String savePath = servletContext.getRealPath("/resources/upload/");
            String originalFileName = file.getOriginalFilename();
            String saveFileName = UUID.randomUUID().toString() + "_" + originalFileName;

            File saveFile = new File(savePath, saveFileName);
            file.transferTo(saveFile);

            // 업로드된 이미지 URL 반환
            response.put("url", "/resources/upload/" + saveFileName);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return response;
    }
    
    
    //17:27 김준석 게시물 삭제 추가 
    @GetMapping("/deleteLostItem")
    public String deleteLostItem(@RequestParam("lostNo") int lostNo, RedirectAttributes redirectAttributes) {
        int result = lostItemService.deleteLostItem(lostNo);

        if (result > 0) {
            redirectAttributes.addFlashAttribute("msg", "게시물이 삭제되었습니다.");
        } else {
            redirectAttributes.addFlashAttribute("msg", "게시물 삭제에 실패했습니다.");
        }
        return "redirect:/lostList";
    }


    
}
