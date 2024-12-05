package com.kh.ski.member.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ski.member.model.service.MemberService;
import com.kh.ski.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping(value = "login.me", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView loginMember(Member m,
									ModelAndView mv,
									HttpSession session,
									HttpServletResponse response) {
		
		/*
		Member loginMember = memberService.loginMember(m);
		
		if(loginMember == null) { // 로그인 실패
			
			// 에러문구를 requestScope 에 담아서
			// 에러페이지로 포워딩
			mv.addObject("alertMsg", "로그인 실패");
			
			// > /WEB-INF/views/common/errorPage.jsp
			mv.setViewName("member/MemberLogin");
			
		} else { // 로그인 성공
			
			// loginUser 를 sessionScope 에 담아서
			// 메인페이지로 url 재요청
			session.setAttribute("loginMember", loginMember);
		    System.out.println("로그인 성공: " + loginMember.getMemberId());
			// + 로그인 성공 시 sessionScope 에
			//   일회성 알람 문구까지 같이 담을 예정 (alertMsg)
			session.setAttribute("alertMsg", "로그인 성공");
			
			mv.setViewName("redirect:/");
		}
		return mv;
		
		*/
		
		
		Member loginMember = memberService.loginMember(m);
		
		if((loginMember != null) && 
			(bcryptPasswordEncoder.matches(m.getMemberPwd(), loginMember.getMemberPwd()))) {
			
			session.setAttribute("loginMember", loginMember);
			
			mv.setViewName("redirect:/");
			
		} else {
		    System.out.println("로그인 실패: 아이디 또는 비밀번호가 일치하지 않습니다.");
			
			mv.addObject("alertMsg", "로그인 실패");
			
			mv.setViewName("member/MemberLogin");
		}
	
		return mv;
	
	
	}
	
	@GetMapping("enrollForm.me")
	public ModelAndView enrollForm(ModelAndView mv) {
		
		mv.setViewName("member/MemberEnrollForm");
		
		return mv;
	}
	
	@PostMapping("insert.me")
	public String insertMember(Member m,
							   Model model,
							   HttpSession session) {
		
	
	String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
	// System.out.println(encPwd);
	
	m.setMemberPwd(encPwd);
	
	int result = memberService.insertMember(m);
	
	if(result > 0) {
		
		session.setAttribute("alertMsg", "회원가입의 성공했습니다!");
		
		return "redirect:/";
		
	} else {
		
		model.addAttribute("alertMsg", "회원가입의 실패하였습니다.");
		
		return "member/MemberEnrollFrom";
		
		
	}
		
	
	
	
	
}
	@GetMapping(value = "idCheck.me", produces = "text/plain; charset=UTF-8")
	@ResponseBody // 문자열을 HTTP 응답 본문으로 반환
	public String idCheck(@RequestParam("checkId") String checkId) {
	    int count = memberService.idCheck(checkId);
	    return (count > 0) ? "NNNNN" : "NNNNY"; // 중복 여부에 따라 결과 반환
	}

	
	
}
