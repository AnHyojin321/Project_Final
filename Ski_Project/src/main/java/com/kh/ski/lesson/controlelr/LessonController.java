package com.kh.ski.lesson.controlelr;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.ski.common.model.vo.PageInfo;
import com.kh.ski.common.template.Pagination;
import com.kh.ski.lesson.model.service.LessonService;
import com.kh.ski.lesson.model.vo.Lesson;

@Controller
public class LessonController {

	@Autowired
	private LessonService lessonService;
	
	
	@GetMapping("list.le")
	public String selectList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
	    
	    int listCount = lessonService.selectListCount();
	    int pageLimit = 10;
	    int boardLimit = 10;
	    
	    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
	    ArrayList<Lesson> list = lessonService.selectList(pi);
	    
	    model.addAttribute("list", list);
	    model.addAttribute("pi", pi);
	    
	    return "lesson/LessonListView";
	}

	
	
	
}
