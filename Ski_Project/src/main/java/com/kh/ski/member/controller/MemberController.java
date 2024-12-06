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

	private Map<String, String> certNoList = Collections.synchronizedMap(new HashMap<>());

	
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
	        String email = m.getEmail().trim(); // 공백 제거
	        String certNo = certNoList.get(email); // 인증번호 조회

	        System.out.println("certNoList 상태: " + certNoList);
	        System.out.println("이메일: " + email);
	        System.out.println("인증번호: " + certNo);

	        if (certNo != null) {
	            int emailCertResult = memberService.insertEmailCert(email, certNo);
	            if (emailCertResult > 0) {
	                certNoList.remove(email); // 인증번호 삭제
	                session.setAttribute("alertMsg", "회원가입 성공! 이메일 인증 데이터 저장 완료.");
	            } else {
	                session.setAttribute("alertMsg", "회원가입 성공! 이메일 인증 데이터 저장 실패.");
	            }
	        } else {
	            session.setAttribute("alertMsg", "회원가입 성공! 인증번호가 존재하지 않습니다.");
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
	@PostMapping(value="cert.do", produces="text/html; charset=UTF-8")
	public String sendCertNo(String email) {
	    String trimmedEmail = email.trim().toLowerCase();
	    int random = (int) (Math.random() * 900000 + 100000);
	    certNoList.put(trimmedEmail, String.valueOf(random));
	    System.out.println("certNoList에 저장됨: " + certNoList);

	    SimpleMailMessage message = new SimpleMailMessage();
	    message.setSubject("[SEOLLENEUN RESORT] 이메일 인증 번호입니다.");
	    message.setText("인증 번호: " + random);
	    message.setTo(email);
	    mailSender.send(message);

	    return "인증번호 발급 완료";
	}



	
	@ResponseBody
	@PostMapping(value="validate.do",
				 produces="text/html; charset=UTF-8")
	public String validate(String email, String certNo) {
			
		// certNoList 로 부터
		// email 과 checkNo 이 정확하게 모두 일치하는 것을 찾아주면 됨!!
		
		String result = "";
		
		// CERT 테이블에서 SELECT
		// SELECT * FROM CERT WHERE 이메일, 인증번호 모두 일치하고 
		// 그리고 SYSDATE < CREATE_DATE + 3분
		// > 3분 이내라면 조회가 되고, 3분 이후라면 null
		if(certNoList.get(email) != null && 
				certNoList.get(email).equals(certNo)) {
			
			result = "인증 성공";
			
		} else {
			
			result = "인증 실패";
		}
		
		// 인증번호 대조작업 완료 후 주의할점 이라고 한다면
		// 인증번호는 "1회성" 임!!
		// > 대조에 성공했든, 실패했든 간에 인증번호 발급 내역을
		//   꼭 지워줘야 한다라는 것!!
		certNoList.remove(email);
		
		// CERT 테이블 DELETE
		
		// System.out.println(certNoList);
		
		return result;
	}
	
	// 카카오

	
	
	
}
