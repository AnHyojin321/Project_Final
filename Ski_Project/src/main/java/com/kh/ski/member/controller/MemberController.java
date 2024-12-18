package com.kh.ski.member.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
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
	
	private String generateTempPassword(int length) {
		
		String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		StringBuilder tempPwd = new StringBuilder();
		for(int i = 0; i < length; i++) {
			
			int random = (int)(Math.random() * chars.length());
			tempPwd.append(chars.charAt(random));
			
		}
		return tempPwd.toString();
	}

	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
//    @Value("${kakao.client-id}")
//    private String clientId;
//
//    @Value("${kakao.redirect-uri}")
//    private String redirectUri;	
//	
// 
//
//    /**
//     * 액세스 토큰 요청
//     */
//    private String getAccessToken(String code) {
//        RestTemplate restTemplate = new RestTemplate();
//        String url = "https://kauth.kakao.com/oauth/token";
//
//        // 요청 파라미터 설정
//        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
//        params.add("grant_type", "authorization_code");
//        params.add("client_id", "f2efc5913b287d02f1ca471e0572580f");
//        params.add("redirect_uri", "http://localhost:8090/ski/");
//        params.add("code", code);
//
//        // 헤더 설정
//        HttpHeaders headers = new HttpHeaders();
//        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
//
//        // 요청 전송
//        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params, headers);
//        ResponseEntity<Map> response = restTemplate.postForEntity(url, request, Map.class);
//
//        Map<String, Object> body = response.getBody();
//        return body != null ? (String) body.get("access_token") : null;
//    }
//
//    /**
//     * 카카오 사용자 정보 요청
//     */
//    private Map<String, Object> getUserInfo(String accessToken) {
//        RestTemplate restTemplate = new RestTemplate();
//        String url = "https://kapi.kakao.com/v2/user/me";
//
//        // 헤더 설정
//        HttpHeaders headers = new HttpHeaders();
//        headers.add("Authorization", "Bearer " + accessToken);
//
//        HttpEntity<String> request = new HttpEntity<>(headers);
//
//        // 요청 전송
//        ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.GET, request, Map.class);
//
//        Map<String, Object> body = response.getBody();
//        if (body != null) {
//            Map<String, Object> kakaoAccount = (Map<String, Object>) body.get("kakao_account");
//            Map<String, Object> profile = (Map<String, Object>) kakaoAccount.get("profile");
//
//            // 사용자 정보 추출
//            Map<String, Object> userInfo = new HashMap<>();
//            userInfo.put("id", body.get("id")); // 카카오 고유 ID
//            userInfo.put("email", kakaoAccount.get("email")); // 이메일
//            userInfo.put("nickname", profile.get("nickname")); // 닉네임
//            return userInfo;
//        }
//        return null;
//    }
//    
//    /**
//     * 카카오 로그인 콜백 처리
//     */
//    @GetMapping("/kakao/callback")
//    public String kakaoCallback(@RequestParam("code") String code, HttpSession session, Model model) {
//        try {
//            // 1. 액세스 토큰 요청
//            String accessToken = getAccessToken(code);
//
//            // 2. 사용자 정보 요청
//            Map<String, Object> userInfo = getUserInfo(accessToken);
//
//            if (userInfo != null) {
//                // 3. 사용자 정보 처리 및 DB 삽입
//                Member kakaoMember = memberService.processKakaoUser(userInfo);
//
//                // 4. 세션에 로그인 정보 저장
//                session.setAttribute("loginMember", kakaoMember);
//                return "redirect:/main"; // 메인 페이지로 이동
//            } else {
//                model.addAttribute("errorMsg", "카카오 로그인 실패");
//                return "common/errorPage"; // 에러 페이지로 이동
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            model.addAttribute("errorMsg", "카카오 로그인 중 오류 발생");
//            return "common/errorPage";
//        }
//    }	
//    
    
    
	@RequestMapping(value = "login.me", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView loginMember(Member m, ModelAndView mv, HttpSession session, HttpServletResponse response) {
	    // 사용자가 로그인 폼에 접속하는 경우 (GET 요청)
	    if (m.getMemberId() == null || m.getMemberPwd() == null) {
	        mv.setViewName("member/MemberLogin"); // 로그인 페이지로 이동
	        return mv;
	    }

	    // POST 요청으로 로그인 처리
	    Member loginMember = memberService.loginMember(m);

	    if (loginMember != null) {
	        // 1. 정규 비밀번호 확인
	        if (bcryptPasswordEncoder.matches(m.getMemberPwd(), loginMember.getMemberPwd())) {
	            session.setAttribute("loginMember", loginMember);
	            System.out.println("로그인 정보 : " + loginMember);
	            mv.setViewName("redirect:/"); // 메인 페이지로 이동
	        } 
	        // 2. 임시 비밀번호 확인
	        else if (loginMember.getTempPwd() != null 
	                 && bcryptPasswordEncoder.matches(m.getMemberPwd(), loginMember.getTempPwd())) {
	            session.setAttribute("loginMember", loginMember);
	            System.out.println("임시 비밀번호로 로그인 성공 : " + loginMember);
	            mv.setViewName("redirect:/"); // 메인 페이지로 이동
	        } 
	        // 3. 비밀번호 불일치
	        else {
	            mv.addObject("alertMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");
	            mv.setViewName("member/MemberLogin");
	        }
	    } 
	    // 회원 정보 없음
	    else {
	        mv.addObject("alertMsg", "존재하지 않는 회원입니다.");
	        mv.setViewName("member/MemberLogin");
	    }

	    return mv;
	}

	@GetMapping("logout.me") 
	// 다른 옵션을 나열할 것이 아니라면 value= 은 생략 가능
	public String logoutMember(HttpSession session) {
		
		// 로그아웃 구현 방법
		// 1. removeAttribute 메소드 이용
		session.removeAttribute("loginMember");
		
		// 2. 세션 무효화 (invalidate 메소드)
		// session.invalidate();
		
		// + sessionScope 에 alertMsg 담기
		// session.setAttribute("alertMsg", "로그아웃 성공");
		
		// 메인페이지로 url 재요청
		return "redirect:/";
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





	@GetMapping(value = "idCheck.me", produces = "text/html; charset=UTF-8")
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
	@PostMapping(value = "validate.do", produces = "text/html; charset=UTF-8")
	public String validate(String email, String certNo, HttpSession session) {
	    // 세션에서 인증번호 가져오기
	    String sessionCertNo = (String) session.getAttribute("certNo");
	    String sessionEmail = (String) session.getAttribute("email");

	    // 입력값 정리
	    String normalizedEmail = email.trim().toLowerCase();

//	    System.out.println("세션 이메일: " + sessionEmail);
//	    System.out.println("세션 인증번호: " + sessionCertNo);
//	    System.out.println("입력 이메일: " + normalizedEmail);
//	    System.out.println("입력 인증번호: " + certNo);

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

	@GetMapping("myPage.me")
	public String myPage() {
		
		return "mypage/myPage";
	}
	
//	@GetMapping("findPwd.me")
//	public String findPwd() {
//		
//		return "member/MemberFindPwd";
//	}
	/*
	@RequestMapping(value = "findPwd.me", method = {RequestMethod.GET, RequestMethod.POST})
	public String findPwd(
	    @RequestParam(value = "memberId", required = false) String memberId,
	    @RequestParam(value = "memberEmail", required = false) String memberEmail,
	    Model model) {

	    if (memberId == null || memberEmail == null) {
	        return "member/MemberFindPwd"; // GET 요청: 페이지 이동
	    }

	    // POST 요청: 아이디 찾기 처리
	    String memberPwd = memberService.findPwd(memberId, memberEmail);
	    if (memberPwd != null) {
	        model.addAttribute("resultMsg", "고객님의 비밀번호는 " + memberPwd + " 입니다.");
	    } else {
	        model.addAttribute("resultMsg", "일치하는 회원 정보를 찾을 수 없습니다.");
	    }

	    return "member/MemberFindPwd"; // 결과 메시지 포함하여 같은 페이지로 반환
	}
*/
	@RequestMapping(value = "findPwd.me", method = {RequestMethod.GET, RequestMethod.POST})
	public String findPwd(String memberId, String email, Model model) {
	    if (memberId == null || email == null) {
	        // 아무 메시지도 설정하지 않고 초기 렌더링
	        return "member/MemberFindPwd";
	    }

	    // 기존 비밀번호 조회 로직과 초기화 로직 유지
	    String existingPwd = memberService.findPwd(memberId, email);
	    if (existingPwd != null) {
	        String tempPwd = generateTempPassword(10);
	        String encTempPwd = bcryptPasswordEncoder.encode(tempPwd);
	        int result = memberService.updatePassword(memberId, encTempPwd);

	        if (result > 0) {
	            try {
	                SimpleMailMessage message = new SimpleMailMessage();
	                message.setSubject("[SEOLLENEUN RESORT] 임시 비밀번호 안내");
	                message.setText("임시 비밀번호: " + tempPwd + "\n로그인 후 비밀번호를 반드시 변경해주세요.");
	                message.setTo(email);
	                mailSender.send(message);

	                model.addAttribute("resultMsg", "임시 비밀번호가 이메일로 발송되었습니다. 확인해주세요.");
	            } catch (Exception e) {
	                model.addAttribute("resultMsg", "임시 비밀번호 생성은 성공했지만 이메일 발송에 실패했습니다.");
	            }
	        } else {
	            model.addAttribute("resultMsg", "임시 비밀번호 생성에 실패했습니다.");
	        }
	    } else {
	        model.addAttribute("resultMsg", "입력하신 정보와 일치하는 회원을 찾을 수 없습니다.");
	    }
	    return "member/MemberFindPwd";
	}

	
	@PostMapping("update.me")
	public String updateMember(Member m, HttpSession session, Model model) {
	    // 비밀번호는 업데이트 대상에서 제외
	    m.setMemberPwd(null);

	    int result = memberService.updateMember(m);

	    if (result > 0) {
	        Member updateMem = memberService.loginMember(m);

	        session.setAttribute("loginMember", updateMem);
	        session.setAttribute("alertMsg", "회원정보 변경 성공");

	        return "redirect:/myPage.me";
	    } else {
	        model.addAttribute("alertMsg", "회원정보 변경 실패");
	        return "redirect:/myPage.me";
	    }
	}

	
	@PostMapping("delete.me")
	public String deleteMember(String memberPwd, String memberId, HttpSession session,
	                           Model model) {
	    Member loginMember = (Member) session.getAttribute("loginMember");

	    if (loginMember == null) {
	        System.out.println("세션에 로그인 정보가 없습니다.");
	        session.setAttribute("alertMsg", "로그인 후 이용해주세요.");
	        return "redirect:/loginPage.me";
	    }

	    String encPwd = loginMember.getMemberPwd();

	    System.out.println("입력된 비밀번호: " + memberPwd);
	    System.out.println("암호화된 비밀번호: " + encPwd);

	    // 입력된 비밀번호와 암호화된 비밀번호 비교
	    if (bcryptPasswordEncoder.matches(memberPwd, encPwd)) {
	        int result = memberService.deleteMember(memberId);

	        if (result > 0) {
	            session.removeAttribute("loginMember");
	            session.setAttribute("alertMsg", "회원 탈퇴 성공");
	            return "redirect:/";
	        } else {
	            model.addAttribute("errorMsg", "회원 탈퇴 실패");
	            return "common/errorPage";
	        }
	    } else {
	        session.setAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
	        return "redirect:/myPage.me";
	    }
	}


	/*
	@PostMapping("changePwd.me")
	public String changePassword(@RequestParam("currentPwd") String currentPwd,
	                             @RequestParam("newPwd") String newPwd,
	                             HttpSession session, Model model) {

	    // 로그인된 사용자 정보 가져오기
	    Member loginMember = (Member) session.getAttribute("loginMember");

	    if (loginMember == null) {
	        model.addAttribute("alertMsg", "로그인이 필요합니다.");
	        return "redirect:/login.me";
	    }

	    int memberNo = loginMember.getMemberNo();

	    // 서비스 계층에서 비밀번호 변경 수행
	    int result = memberService.changePwd(memberNo, newPwd, currentPwd);

	    if (result == 1) {
	        session.setAttribute("alertMsg", "비밀번호가 성공적으로 변경되었습니다.");
	        return "redirect:/myPage.me";
	    } else if (result == 0) {
	        model.addAttribute("alertMsg", "현재 비밀번호가 일치하지 않습니다.");
	    } else {
	        model.addAttribute("alertMsg", "비밀번호 변경에 실패했습니다.");
	    }

	    return "member/myPage";
	}
*/
	
	@GetMapping("PwdChange.me")
	public String pwdChange() {
		
		return "member/PwdChange";
	}

	
	@PostMapping("changePwd.me")
	public String changePassword(@RequestParam("currentPwd") String currentPwd,
	                             @RequestParam("newPwd") String newPwd,
	                             HttpSession session, Model model) {

	    // 로그인된 사용자 정보 가져오기
	    Member loginMember = (Member) session.getAttribute("loginMember");

	    if (loginMember == null) {
	        model.addAttribute("alertMsg", "로그인이 필요합니다.");
	        return "redirect:/login.me";
	    }

	    int memberNo = loginMember.getMemberNo();

	    // 서비스 계층에서 비밀번호 변경 수행
	    int result = memberService.changePwd(memberNo, newPwd, currentPwd);

	    if (result > 0) {
	        session.setAttribute("alertMsg", "비밀번호가 성공적으로 변경되었습니다.");
	        return "redirect:/myPage.me";
	    } else {
	        model.addAttribute("alertMsg", "현재 비밀번호가 일치하지 않거나 변경에 실패했습니다.");
	        return "mypage/myPage";
	    }
	}

	@GetMapping("myPage1.me")
	public String myPage1() {
		
		return "mypage/myPage1";
		
	}
	
	@GetMapping("idDelete.me")
	public String idDelete() {
		return "member/DeleteId";
	}

	
	@GetMapping("lessonPay.le")
	public String lessonPay() {
		return "lesson/LessonPay";
	}
	
}
