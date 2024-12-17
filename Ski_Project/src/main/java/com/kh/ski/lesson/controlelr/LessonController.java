	package com.kh.ski.lesson.controlelr;
	
	import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
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
	private JavaMailSender mailSender;
	
	
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
	public ModelAndView insertLesson(Lesson les, HttpSession session, ModelAndView mv) {
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
	        // 이메일 전송 로직
	        try {
	            SimpleMailMessage message = new SimpleMailMessage();
	            message.setTo(loginMember.getEmail()); // 수신자 이메일
	            message.setSubject("[SEOLLENEUN RESORT] 강습 예약 확인 및 입금 안내");
	            message.setText(
	                "안녕하세요, " + loginMember.getMemberName() + "님!\n\n" +
	                "강습 예약이 접수되었습니다.\n" +
	                "예약 상세 정보:\n" +
	                "- 강습 날짜: " + les.getLessonDate() + "\n" +
	                "- 강습 시간: " + les.getLessonTime() + "\n" +
	                "- 강습 종류: " + les.getLessonActivite() + "\n" +
	                "- 강습 프로그램 : " + les.getLessonType() + "\n" +
	                "- 예약 인원 : " + les.getLessonResCount() + "\n" +
	                "- 예약 확인 번호 : " + les.getLessonPhone() + "\n\n" +
	                "입금 계좌 정보:\n" +
	                "은행명: 우리은행\n" +
	                "계좌번호: 000-0000-0000-000\n" +
	                "예금주: 스키장\n\n" +
	                "입금을 확인 후 예약 확정이 진행됩니다.\n감사합니다!"
	            );
	            mailSender.send(message);
	            session.setAttribute("alertMsg", "강습 예약글 작성 성공 및 이메일 발송 완료");
	        } catch (Exception e) {
	            session.setAttribute("alertMsg", "강습 예약글 작성 성공, 그러나 이메일 발송 실패");
	        }

	        mv.setViewName("redirect:list.le"); // 예약 목록으로 이동
	    } else {
	        session.setAttribute("resultMsg", "강습 예약글 작성 실패");
	        mv.setViewName("lesson/LessonAddForm"); // 다시 작성 폼으로 이동
	    }

	    return mv;
	}


	@GetMapping("lesson/{resNo}") // 상세보기 경로
	public ModelAndView selectLesson(@PathVariable("resNo") int resNo, 
	                                 ModelAndView mv, 
	                                 HttpSession session) {
	    Lesson lesson = lessonService.selectLesson(resNo);
	    Member loginMember = (Member) session.getAttribute("loginMember");

	    if (lesson != null && loginMember != null) {
	        mv.addObject("les", lesson);
	        mv.addObject("loginMember", loginMember);
	        mv.setViewName("lesson/LessonDetailForm");
	    } else {
	        session.setAttribute("alertMsg", "해당 예약글이 존재하지 않습니다.");
	        mv.setViewName("redirect:/list.le");
	    }
	    return mv;
	}

	@GetMapping("lesson/updateForm") // 수정 폼 경로
	public String updateForm(@RequestParam("resNo") int resNo, 
	                         HttpSession session, 
	                         Model model) {
	    // 로그인 확인
	    Member loginMember = (Member) session.getAttribute("loginMember");
	    if (loginMember == null) {
	        session.setAttribute("alertMsg", "로그인이 필요합니다.");
	        return "redirect:/login";
	    }

	    // 예약 정보 조회
	    Lesson lesson = lessonService.selectLesson(resNo);
	    if (lesson == null) {
	        session.setAttribute("alertMsg", "해당 예약글이 존재하지 않습니다.");
	        return "redirect:/list.le";
	    }

	    // JSP로 데이터 전달
	    model.addAttribute("les", lesson);
	    model.addAttribute("loginMember", loginMember);
	    return "lesson/LessonUpdateForm";
	}

	// 수정한내용 저장시키기
	@PostMapping("lesson/updateLesson")
	public String updateLesson(Lesson les, Model model, HttpSession session) {
	    
	    int result = lessonService.updateLesson(les);
	    System.out.println("Lesson Data: " + les);
	    
	    if(result > 0) {
	        session.setAttribute("alertMsg", "예약내용 수정 성공");
	        return "redirect:/list.le";  // 리다이렉트로 목록 페이지로 이동
	    } else {
	        model.addAttribute("alertMsg", "예약 내용 수정 실패");
	        return "redirect:/lesson/updateForm?resNo=" + les.getResNo();  // 다시 수정 폼으로 이동
	    }
	}

	@PostMapping("delete.le")
	public String deleteLesson(int resNo,
							   Model model,
							   HttpSession session) {
		
		int result = lessonService.deleteLesson(resNo);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "게시물 삭제에 성공했습니다");
			return "redirect:/list.le";
		} else {
			
			model.addAttribute("alertMsg", "예약 게시물 삭제에 실패했습니다.");
			
			return "redirect:/list.le";
		}
		
		
	}


	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
}
