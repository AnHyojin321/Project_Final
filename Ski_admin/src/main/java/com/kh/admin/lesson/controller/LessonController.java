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

import com.kh.admin.lesson.model.service.LessonService;
import com.kh.admin.lesson.model.vo.Lesson;

@Controller
public class LessonController {

    @Autowired
    private LessonService lessonService;

    // 예약 리스트 조회
	@RequestMapping(value = "lesson.ad", method = {RequestMethod.GET, RequestMethod.POST})
    public String lessonList(Model model) {
        List<Lesson> lessonList = lessonService.selectAllLessons(); // 전체 예약 목록 조회
        model.addAttribute("lessonList", lessonList);
        return "lesson/lessonList"; // JSP 경로
    }

    // 예약 상태 변경
	@PostMapping("lesson/updateStatus.ad")
	@ResponseBody
	public String updateLessonStatus(@RequestParam("resNo") int resNo, @RequestParam("lessonStatus") String lessonStatus) {
	    System.out.println("resNo: " + resNo);
	    System.out.println("lessonStatus: " + lessonStatus);
	    int result = lessonService.updateLessonStatus(resNo, lessonStatus);
	    return (result > 0) ? "success" : "fail";
	}

}
