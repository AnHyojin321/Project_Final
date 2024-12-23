package com.kh.ski.notice.controller;

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

import com.kh.ski.common.model.vo.PageInfo;
import com.kh.ski.common.template.Pagination;
import com.kh.ski.notice.model.service.NoticeService;
import com.kh.ski.notice.model.vo.Notice;

@Controller
public class NoticeController {

	
	    @Autowired
	    private NoticeService noticeService;

	    @Autowired
	    private ServletContext servletContext;

	    @GetMapping("/noticeList")
	    public String selectNoticeList(
	            @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
	            Model model) {

	        int listCount = noticeService.selectListCount();

	        int pageLimit = 5;   // 하단 페이지 번호 최대 개수
	        int boardLimit = 10; // 한 페이지에 표시할 게시글 수
	        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

	        Map<String, Integer> paramMap = new HashMap<>();
	        paramMap.put("startRow", (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
	        paramMap.put("endRow", pi.getCurrentPage() * pi.getBoardLimit());
	        List<Notice> list = noticeService.selectNoticeListPaging(paramMap);

	        // 디버깅 코드 추가
	        System.out.println("공지사항 목록 데이터: " + list);

	        model.addAttribute("list", list);
	        model.addAttribute("pi", pi);

	        return "notice/noticeList";
	    }


	    // 공지사항 상세보기
	    @GetMapping("/noticeDetail")
	    public String selectNoticeDetail(@RequestParam("noticeNo") int noticeNo, Model model) {
	        // 게시글 정보 조회
	        Notice notice = noticeService.selectNoticeDetail(noticeNo);

	        // 이전 게시글 조회
	        Notice prevNotice = noticeService.selectPrevNotice(noticeNo);

	        // 다음 게시글 조회
	        Notice nextNotice = noticeService.selectNextNotice(noticeNo);

	        // 조회된 게시글 정보를 모델에 추가
	        model.addAttribute("notice", notice);
	        model.addAttribute("prevNotice", prevNotice);
	        model.addAttribute("nextNotice", nextNotice);

	        // 디버깅 코드
	        System.out.println("현재 게시글: " + notice);
	        System.out.println("이전 게시글: " + prevNotice);
	        System.out.println("다음 게시글: " + nextNotice);

	        // 상세보기 페이지로 이동
	        return "notice/noticeDetail"; // JSP 경로
	    }

	   

	
	
	
}
