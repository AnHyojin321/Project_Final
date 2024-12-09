package com.kh.ski.member.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ski.member.model.service.MemberService;
import com.kh.ski.member.model.vo.Member;

@Controller
public class MemberController {

	
	private static Map<String, String> certNoList = Collections.synchronizedMap(new HashMap<>());

	
	@Autowired
	private JavaMailSender mailSender;
	
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
	/*
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
	*/
	
	@PostMapping("insert.me")
	public String insertMember(Member m, Model model, HttpSession session) {
	    String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
	    m.setMemberPwd(encPwd);

	    int result = memberService.insertMember(m);
	    if (result > 0) {
	        // 세션에서 이메일과 인증번호 가져오기
	        String sessionEmail = (String) session.getAttribute("email");
	        String sessionCertNo = (String) session.getAttribute("certNo");

	        System.out.println("Controller - 세션 이메일: " + sessionEmail);
	        System.out.println("Controller - 세션 인증번호: " + sessionCertNo);

	        // 입력된 이메일과 인증번호 비교
	        if (sessionEmail != null && sessionEmail.equals(m.getEmail().trim().toLowerCase())
	                && sessionCertNo != null) {
	            int emailCertResult = memberService.insertEmailCert(sessionEmail, sessionCertNo);

	            if (emailCertResult > 0) {
	                session.removeAttribute("certNo"); // 인증번호 삭제
	                session.removeAttribute("email"); // 이메일 삭제
	                session.setAttribute("alertMsg", "회원가입 성공! 이메일 인증 데이터 저장 완료.");
	            } else {
	                session.setAttribute("alertMsg", "회원가입 성공! 이메일 인증 데이터 저장 실패.");
	            }
	        } else {
	            session.setAttribute("alertMsg", "회원가입 성공! 인증번호가 유효하지 않습니다.");
	        }
	        return "redirect:/";
	    } else {
	        model.addAttribute("alertMsg", "회원가입 실패");
	        return "member/MemberEnrollForm";
	    }
	}





	@GetMapping(value = "idCheck.me", produces = "text/plain; charset=UTF-8")
	@ResponseBody // 문자열을 HTTP 응답 본문으로 반환
	public String idCheck(@RequestParam("checkId") String checkId) {
	    int count = memberService.idCheck(checkId);
	    return (count > 0) ? "NNNNN" : "NNNNY"; // 중복 여부에 따라 결과 반환
	}

	/*
	@ResponseBody
	@PostMapping(value="cert.do",
				 produces="text/html; charset=UTF-8")
	public String sendCertNo(String email) {
		
		int random = (int)(Math.random() * 900000 + 100000);
		
		certNoList.put(email, String.valueOf(random));
		
		SimpleMailMessage message = new SimpleMailMessage();
		
		message.setSubject("[SEOLLENEUN RESOT] 이메일 인증 번호입니다.");
		message.setText("인증 번호 : " + random);
		message.setTo(email);
		
		mailSender.send(message);
		
		
		return "인증번호 발급 완료";
		
		
		
	}
*/
	@ResponseBody
	@PostMapping(value = "cert.do", produces = "text/html; charset=UTF-8")
	public String sendCertNo(String email, HttpSession session) {
	    // 이메일 정리 (공백 제거 및 소문자 변환)
	    String normalizedEmail = email.trim().toLowerCase();

	    // 인증번호 생성
	    int random = (int) (Math.random() * 900000 + 100000);

	    // 인증번호를 세션에 저장
	    session.setAttribute("certNo", String.valueOf(random));
	    session.setAttribute("email", normalizedEmail); // 이메일도 세션에 저장

	    // 디버깅 로그
	    System.out.println("sendCertNo - 저장된 이메일: " + normalizedEmail);
	    System.out.println("sendCertNo - 생성된 인증번호: " + random);
	    System.out.println("sendCertNo - 세션 상태: " + session.getAttribute("certNo"));

	    // 이메일 전송
	    SimpleMailMessage message = new SimpleMailMessage();
	    message.setSubject("[SEOLLENEUN RESORT] 이메일 인증 번호입니다.");
	    message.setText("인증 번호: " + random);
	    message.setTo(email);
	    mailSender.send(message);

	    return "인증번호 발급 완료";
	}





	
	@ResponseBody
	@GetMapping(value = "validate.do", produces = "text/html; charset=UTF-8")
	public String validate(String email, String certNo, HttpSession session) {
	    // 세션에서 인증번호 가져오기
	    String sessionCertNo = (String) session.getAttribute("certNo");
	    String sessionEmail = (String) session.getAttribute("email");

	    // 입력값 정리
	    String normalizedEmail = email.trim().toLowerCase();

	    System.out.println("validate - 세션 이메일: " + sessionEmail);
	    System.out.println("validate - 세션 인증번호: " + sessionCertNo);
	    System.out.println("validate - 입력 이메일: " + normalizedEmail);
	    System.out.println("validate - 입력 인증번호: " + certNo);

	    // 인증번호와 이메일 비교
	    if (sessionCertNo != null && sessionCertNo.equals(certNo) 
	            && sessionEmail != null && sessionEmail.equals(normalizedEmail)) {
	        return "인증 성공";
	    } else {
	        return "인증 실패";
	    }
	}

	
	@RequestMapping(value = "findId.me", method = {RequestMethod.GET, RequestMethod.POST})
	public String findId(
	    @RequestParam(value = "memberName", required = false) String memberName,
	    @RequestParam(value = "memberEmail", required = false) String memberEmail,
	    Model model) {

	    if (memberName == null || memberEmail == null) {
	        return "member/MemberFindId"; // GET 요청: 페이지 이동
	    }

	    // POST 요청: 아이디 찾기 처리
	    String memberId = memberService.findId(memberName, memberEmail);
	    if (memberId != null) {
	        model.addAttribute("resultMsg", "고객님의 아이디는 **" + memberId + "** 입니다.");
	    } else {
	        model.addAttribute("resultMsg", "일치하는 회원 정보를 찾을 수 없습니다.");
	    }

	    return "member/MemberFindId"; // 결과 메시지 포함하여 같은 페이지로 반환
	}



}
