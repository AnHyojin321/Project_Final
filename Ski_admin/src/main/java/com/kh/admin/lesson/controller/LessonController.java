package com.kh.admin.lesson.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.admin.common.model.vo.PageInfo;
import com.kh.admin.common.template.Pagination;
import com.kh.admin.lesson.model.service.LessonService;
import com.kh.admin.lesson.model.vo.Lesson;

@Controller
public class LessonController {

    @Autowired
    private LessonService lessonService;

    @RequestMapping(value = "lesson.ad", method = {RequestMethod.GET, RequestMethod.POST})
    public String lessonList(
            @RequestParam(value = "keyword", required = false) String keyword,
            @RequestParam(value = "resStatus", required = false) String resStatus,
            @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
            @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
            Model model) {

        // 총 리스트 개수 조회
        int listCount = lessonService.selectListCount(keyword, resStatus);

        // 페이징 처리
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, pageSize);

        // 강습 리스트 조회
        List<Lesson> lessonList = lessonService.selectLessonList(pi, keyword, resStatus);

        model.addAttribute("pi", pi);
        model.addAttribute("lessonList", lessonList);
        model.addAttribute("keyword", keyword);
        model.addAttribute("resStatus", resStatus);
        model.addAttribute("pageSize", pageSize);

        return "lesson/lessonList";
    }


    // 예약 상태 변경
	@PostMapping("lesson/updateStatus.ad")
	@ResponseBody
	public String updateLessonStatus(@RequestParam("resNo") int resNo, @RequestParam("resStatus") String resStatus) {
	    System.out.println("resNo: " + resNo);
	    System.out.println("lessonStatus: " + resStatus);
	    
	    
	    int result = lessonService.updateLessonStatus(resNo, resStatus);
	    return (result > 0) ? "success" : "fail";
	}
	

}
