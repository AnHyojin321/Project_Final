	package com.kh.ski.lesson.controlelr;
	
	import java.sql.Date;
import java.util.ArrayList;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	public String selectList(
	    @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
	    @RequestParam(value = "keyword", required = false) String keyword,
	    Model model) {

	    int listCount = lessonService.selectListCount(keyword); // 검색 조건에 따른 게시글 총 개수
	    int pageLimit = 10;
	    int boardLimit = 10;

	    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
	    ArrayList<Lesson> list = lessonService.selectList(pi, keyword); // 검색어를 포함한 데이터 조회

	    model.addAttribute("list", list);
	    model.addAttribute("pi", pi);
	    model.addAttribute("keyword", keyword); // 검색어를 JSP에 전달

	    return "lesson/LessonListView"; // 기존 JSP 그대로 사용
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
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

	            String emailContent = "<!DOCTYPE html>\n" +
	                "<html lang=\"ko\">\n" +
	                "<head>\n" +
	                "    <meta charset=\"UTF-8\">\n" +
	                "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
	                "    <title>강습 예약 확인</title>\n" +
	                "</head>\n" +
	                "<body style=\"margin: 0; padding: 0; font-family: 'Apple SD Gothic Neo', 'Malgun Gothic', sans-serif;\">\n" +
	                "    <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px; margin: 0 auto; background-color: #ffffff;\">\n" +
	                "        <tr>\n" +
	                "            <td style=\"background: linear-gradient(180deg, #f8e4ff 0%, #e0e9ff 100%); text-align: center; padding: 40px 20px; border-radius: 16px;\">\n" +
	                "                <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n" +
	                "                    <tr>\n" +
	                "                        <td style=\"text-align: center; padding-bottom: 10px;\">\n" +
	                "                            <div style=\"color: #4a6cc3; font-size: 14px; font-weight: bold;\">HAPPY NEW YEAR 2025</div>\n" +
	                "                        </td>\n" +
	                "                    </tr>\n" +
	                "                    <tr>\n" +
	                "                        <td style=\"text-align: center; padding-bottom: 20px;\">\n" +
	                "                            <div style=\"color: #2c4b9e; font-size: 32px; font-weight: bold;\">강습 예약 확인</div>\n" +
	                "                        </td>\n" +
	                "                    </tr>\n" +
	                "                    <tr>\n" +
	                "                        <td style=\"text-align: center;\">\n" +
	                "                            <div style=\"background-color: rgba(255, 255, 255, 0.9); padding: 8px 20px; border-radius: 20px; display: inline-block;\">\n" +
	                "                                <span style=\"color: #4a6cc3; font-size: 14px;\">설레눈 리조트와 함께하는 즐거운 스키 강습</span>\n" +
	                "                            </div>\n" +
	                "                        </td>\n" +
	                "                    </tr>\n" +
	                "                </table>\n" +
	                "            </td>\n" +
	                "        </tr>\n" +
	                "        <tr>\n" +
	                "            <td style=\"padding: 30px 20px;\">\n" +
	                "                <p style=\"color: #333333; font-size: 16px; line-height: 1.6; margin: 0;\">\n" +
	                "                    안녕하세요, " + loginMember.getMemberName() + "님!<br>\n" +
	                "                    강습 예약이 접수되었습니다.\n" +
	                "                </p>\n" +
	                "            </td>\n" +
	                "        </tr>\n" +
	                "        <tr>\n" +
	                "            <td style=\"padding: 0 20px;\">\n" +
	                "                <table width=\"100%\" style=\"background-color: #f8f9fa; border-radius: 12px; padding: 20px;\">\n" +
	                "                    <tr>\n" +
	                "                        <td colspan=\"2\" style=\"padding-bottom: 15px;\">\n" +
	                "                            <div style=\"font-size: 18px; font-weight: bold; color: #2c4b9e;\">예약 상세 정보</div>\n" +
	                "                        </td>\n" +
	                "                    </tr>\n" +
	                "                    <tr>\n" +
	                "                        <td style=\"padding: 8px 0; color: #666666; width: 120px;\">강습 날짜</td>\n" +
	                "                        <td style=\"padding: 8px 0; color: #333333;\">" + les.getLessonDate() + "</td>\n" +
	                "                    </tr>\n" +
	                "                    <tr>\n" +
	                "                        <td style=\"padding: 8px 0; color: #666666;\">강습 시간</td>\n" +
	                "                        <td style=\"padding: 8px 0; color: #333333;\">" + les.getLessonTime() + "</td>\n" +
	                "                    </tr>\n" +
	                "                    <tr>\n" +
	                "                        <td style=\"padding: 8px 0; color: #666666;\">강습 종류</td>\n" +
	                "                        <td style=\"padding: 8px 0; color: #333333;\">" + les.getLessonActivite() + "</td>\n" +
	                "                    </tr>\n" +
	                "                    <tr>\n" +
	                "                        <td style=\"padding: 8px 0; color: #666666;\">강습 프로그램</td>\n" +
	                "                        <td style=\"padding: 8px 0; color: #333333;\">" + les.getLessonType() + "</td>\n" +
	                "                    </tr>\n" +
	                "                    <tr>\n" +
	                "                        <td style=\"padding: 8px 0; color: #666666;\">예약 인원</td>\n" +
	                "                        <td style=\"padding: 8px 0; color: #333333;\">" + les.getLessonResCount() + "명</td>\n" +
	                "                    </tr>\n" +
	                "                </table>\n" +
	                "            </td>\n" +
	                "        </tr>\n" +
	                "    </table>\n" +
	                "</body>\n" +
	                "</html>";

	            helper.setTo(loginMember.getEmail());
	            helper.setSubject("[SEOLLENEUN RESORT] 강습 예약 확인 및 입금 안내");
	            helper.setText(emailContent, true); // HTML 텍스트 전송
	            mailSender.send(message);

	            session.setAttribute("alertMsg", "강습 예약글 작성 성공 및 이메일 발송 완료");
	        } catch (Exception e) {
	            session.setAttribute("alertMsg", "강습 예약글 작성 성공, 그러나 이메일 발송 실패");
	            e.printStackTrace();
	        }

	        mv.setViewName("redirect:list.le"); // 예약 목록으로 이동
	    } else {
	        session.setAttribute("resultMsg", "강습 예약글 작성 실패");
	        mv.setViewName("lesson/LessonAddForm"); // 다시 작성 폼으로 이동
	    }

	    return mv;
	}


	@GetMapping("lesson/{resNo}")
	public ModelAndView selectLesson(@PathVariable("resNo") int resNo, 
	                                 ModelAndView mv, 
	                                 HttpSession session) {
	    // 로그인 정보 확인
	    Member loginMember = (Member) session.getAttribute("loginMember");
	    if (loginMember == null) {
	        session.setAttribute("alertMsg", "로그인이 필요합니다.");
	        mv.setViewName("redirect:/login");
	        return mv;
	    }

	    // 글 정보 조회
	    Lesson lesson = lessonService.selectLesson(resNo);

	    if (lesson != null) {
	        System.out.println("게시글 작성자 ID: " + lesson.getMemberNo());
	        System.out.println("로그인 사용자 ID: " + loginMember.getMemberNo());

	        if (lesson.getMemberNo() == loginMember.getMemberNo()) {
	            mv.addObject("les", lesson);
	            mv.setViewName("lesson/LessonDetailForm");
	        } else {
	            session.setAttribute("alertMsg", "본인이 작성한 글만 확인할 수 있습니다.");
	            mv.setViewName("redirect:/list.le");
	        }
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
