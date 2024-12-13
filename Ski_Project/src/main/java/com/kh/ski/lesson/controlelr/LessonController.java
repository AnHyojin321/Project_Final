package com.kh.ski.lesson.controlelr;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ski.common.model.vo.PageInfo;
import com.kh.ski.common.template.Pagination;
import com.kh.ski.lesson.model.service.LessonService;
import com.kh.ski.lesson.model.vo.Lesson;
import com.kh.ski.member.model.vo.Member;

@Controller
public class LessonController {

	@Autowired
	private LessonService lessonService;
	
	
	@GetMapping("list.le")
	public String selectList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model) {
	    
	    int listCount = lessonService.selectListCount();
	    int pageLimit = 10;
	    int boardLimit = 10;
	    
	    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
	    ArrayList<Lesson> list = lessonService.selectList(pi);
	    
	    model.addAttribute("list", list);
	    model.addAttribute("pi", pi);
	    
	    return "lesson/LessonListView";
	}

	@GetMapping("addLessonForm.le")
	public ModelAndView addLessonForm(ModelAndView mv) {
		
		mv.setViewName("lesson/LessonAddForm");
	
		return mv;
	}
	
	@PostMapping("insert.le")
	public ModelAndView insertLesson(Lesson les,
	                                 HttpSession session,
	                                 ModelAndView mv) {
	    // 로그인한 회원 정보 가져오기
	    Member loginMember = (Member) session.getAttribute("loginMember");

	    // 예약 제목에 회원의 이름 추가
	    les.setLessonTitle(loginMember.getMemberName() + " 예약안내");

	    // 강습 날짜 기본값 설정 (현재 날짜로 설정)
	    if (les.getLessonResDate() == null) {
	        les.setLessonResDate(new Date(System.currentTimeMillis())); // java.sql.Date
	    }

	    // 데이터 삽입
	    int result = lessonService.insertLesson(les);

	    if (result > 0) {
	        session.setAttribute("alertMsg", "강습 예약글 작성 성공");
	        mv.setViewName("redirect:list.le"); // 예약 목록으로 이동
	    } else {
	        session.setAttribute("resultMsg", "강습 예약글 작성 실패");
	        mv.setViewName("lesson/LessonAddForm"); // 다시 작성 폼으로 이동
	    }

	    return mv;
	}


	@GetMapping("lesson/{resNo}")
	public ModelAndView selectLesson(@PathVariable(value="resNo") int resNo, ModelAndView mv, HttpSession session) {

	    Lesson lesson = lessonService.selectLesson(resNo);

	    Member loginMember = (Member) session.getAttribute("loginMember");

	    if (lesson != null && loginMember != null) {
	        mv.addObject("les", lesson);
	        mv.addObject("loginMember", loginMember);
	        mv.setViewName("lesson/LessonDetailForm");
	    } 
	    return mv;
	}

	@GetMapping("updateForm.le")
	public String updateForm(@RequestParam("resNo") int resNo, Model model) {
	    Lesson les = lessonService.selectLesson(resNo);

	    if (les != null) {
	        model.addAttribute("les", les);
	        return "lesson/LessonUpdateForm"; // 수정 페이지 반환
	    } else {
	        model.addAttribute("errorMsg", "해당 예약 정보를 찾을 수 없습니다.");
	        return "common/errorPage"; // 에러 페이지 반환
	    }
	}


	
}
