package com.kh.ski.member.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
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

import com.kh.ski.lift.model.service.LiftService;
import com.kh.ski.lift.model.vo.LiftOrder;
import com.kh.ski.locker.model.service.LockerService;
import com.kh.ski.locker.model.vo.LockerReservation;
import com.kh.ski.member.model.service.KakaoService;
import com.kh.ski.member.model.service.MemberService;
import com.kh.ski.member.model.vo.KakaoUserInfo;
import com.kh.ski.member.model.vo.Member;
import com.kh.ski.pack.model.service.PackageService;
import com.kh.ski.pack.model.vo.PackagePay;
import com.kh.ski.room.model.service.RoomService;
import com.kh.ski.room.model.vo.RoomPay;

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
	
	
	@Autowired
	private KakaoService kakaoService;

	@RequestMapping("/kakao/callback")
	public String kakaoCallback(@RequestParam("code") String code, HttpSession session) {
	    try {
	        // 1. 인가 코드로 액세스 토큰 요청
	        String accessToken = kakaoService.getAccessToken(code);

	        // 2. 사용자 정보 요청
	        KakaoUserInfo kakaoUserInfo = kakaoService.getUserInfo(accessToken);
	        String kakaoId = kakaoUserInfo.getId();
	        String nickname = kakaoUserInfo.getNickname();
	        String email = kakaoUserInfo.getEmail();

	        System.out.println("Kakao User Info: " + kakaoUserInfo);

	        // 3. DB에서 카카오 ID 또는 이메일로 회원 정보 조회
	        Member existingMember = memberService.findMemberByKakaoId(kakaoId);
	        if (existingMember == null) {
	            existingMember = memberService.findMemberByEmail(email);
	        }

	        boolean isFirstLogin = false; // 최초 로그인 여부 확인 플래그

	        if (existingMember == null) {
	            // 3-1. 신규 회원 가입 처리
	            Member newMember = new Member();
	            newMember.setMemberId("kakao_" + kakaoId); // 회원 ID 설정
	            newMember.setMemberName(nickname); // 회원 이름 설정
	            newMember.setEmail(email); // 이메일 설정
	            newMember.setKakaoLogin(kakaoId); // 카카오 로그인 ID 저장

	            // 비밀번호를 BCrypt로 암호화하여 저장
	            String encryptedPwd = bcryptPasswordEncoder.encode("kakao-login");
	            newMember.setMemberPwd(encryptedPwd);

	            // 기본 정보 설정
	            newMember.setPhone("000-0000-0000"); // 기본 전화번호
	            newMember.setBirthDate(java.sql.Date.valueOf("1900-01-01")); // 기본 생년월일
	            newMember.setCreateDate(new java.sql.Date(System.currentTimeMillis())); // 가입일 설정
	            newMember.setMemberStatus("Y"); // 활성 상태

	            // DB에 회원 정보 저장
	            memberService.kakaoInsertMember(newMember);
	            existingMember = memberService.findMemberByKakaoId(kakaoId);
	            isFirstLogin = true;
	        } else if (existingMember.getKakaoLogin() == null) {
	            // 기존 일반 회원인 경우 카카오 로그인 정보 통합
	            existingMember.setKakaoLogin(kakaoId);
	            memberService.updateMember(existingMember);
	        }

	        // 4. 로그인 성공 처리 (세션에 저장)
	        if (existingMember != null) {
	            session.setAttribute("loginMember", existingMember);
	            System.out.println("로그인 사용자 정보: " + existingMember);
	        } else {
	            System.out.println("회원 정보가 DB에서 조회되지 않았습니다.");
	            return "redirect:/error"; // 에러 페이지로 이동
	        }

	        // 5. 리다이렉트 경로 설정
	        if (isFirstLogin) {
	            return "redirect:/myPage.me"; // 최초 로그인 시 마이페이지로 이동
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        return "redirect:/error"; // 에러 발생 시 에러 페이지로 이동
	    }

	    // 기존 회원은 메인 페이지로 이동
	    return "redirect:/";
	}




    
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
	        // 탈퇴한 회원인지 확인
	        if ("N".equals(loginMember.getMemberStatus())) {
	            session.setAttribute("alertMsg", "탈퇴한 회원입니다. 로그인이 불가능합니다.");
	            mv.setViewName("member/MemberLogin");
	            return mv;
	        }

	        // 1. 정규 비밀번호 확인
	        if (bcryptPasswordEncoder.matches(m.getMemberPwd(), loginMember.getMemberPwd())) {
	            session.setAttribute("loginMember", loginMember);
	            mv.setViewName("redirect:/"); // 메인 페이지로 이동
	        } 
	        // 2. 임시 비밀번호 확인
	        else if (loginMember.getTempPwd() != null 
	                 && bcryptPasswordEncoder.matches(m.getMemberPwd(), loginMember.getTempPwd())) {
	            session.setAttribute("loginMember", loginMember);
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
    @ResponseBody
    @PostMapping("emailCheck.me")
    public String emailCheck(@RequestParam("email") String email) {
        boolean isDuplicate = memberService.isEmailDuplicate(email);
        return isDuplicate ? "EXISTS" : "NOT_EXISTS"; // 중복 여부 반환
    }

    @PostMapping("insert.me")
    public String insertMember(Member m, Model model, HttpSession session) {
        // 세션에서 이메일 인증 여부 확인
        String sessionEmail = (String) session.getAttribute("email");
        String sessionCertNo = (String) session.getAttribute("certNo");

        if (sessionEmail == null || sessionCertNo == null || !sessionEmail.equals(m.getEmail().trim().toLowerCase())) {
            model.addAttribute("alertMsg", "이메일 인증이 완료되지 않았습니다.");
            return "member/MemberEnrollForm";
        }

        // 이메일 중복 여부 확인
        if (memberService.isEmailDuplicate(m.getEmail())) {
            model.addAttribute("alertMsg", "이미 가입된 이메일입니다. 다른 이메일을 입력해주세요.");
            return "member/MemberEnrollForm";
        }

        // 비밀번호 암호화
        String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
        m.setMemberPwd(encPwd);

        int result = memberService.insertMember(m);
        if (result > 0) {
            session.removeAttribute("email");
            session.removeAttribute("certNo");
            model.addAttribute("alertMsg", "회원가입이 성공적으로 완료되었습니다!");
            return "member/MemberLogin";
        } else {
            model.addAttribute("alertMsg", "회원가입에 실패했습니다.");
            return "member/MemberEnrollForm";
        }
    }
//	@PostMapping("insert.me")
//	public String insertMember(Member m, Model model, HttpSession session) {
//	    String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
//	    m.setMemberPwd(encPwd);
//
//	    int result = memberService.insertMember(m);
//	    if (result > 0) {
//	        // 세션에서 이메일과 인증번호 가져오기
//	        String sessionEmail = (String) session.getAttribute("email");
//	        String sessionCertNo = (String) session.getAttribute("certNo");
//
//	        System.out.println("Controller - 세션 이메일: " + sessionEmail);
//	        System.out.println("Controller - 세션 인증번호: " + sessionCertNo);
//
//	        // 입력된 이메일과 인증번호 비교
//	        if (sessionEmail != null && sessionEmail.equals(m.getEmail().trim().toLowerCase())
//	                && sessionCertNo != null) {
//	            int emailCertResult = memberService.insertEmailCert(sessionEmail, sessionCertNo);
//
//	            if (emailCertResult > 0) {
//	                session.removeAttribute("certNo"); // 인증번호 삭제
//	                session.removeAttribute("email"); // 이메일 삭제
//	            
//	            }
//	        } else {
//	            session.setAttribute("alertMsg", "회원가입 성공! 인증번호가 유효하지 않습니다.");
//	        }
//	        return "member/MemberLogin";
//	    } else {
//	        model.addAttribute("alertMsg", "회원가입 실패");
//	        return "member/MemberEnrollForm";
//	    }
//	}





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
	
	/*
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
*/
	
	
	@ResponseBody
	@PostMapping("cert.do")
	public String sendCertNo(@RequestParam("email") String email, HttpSession session) {
	    // 이메일 인증번호 생성 및 세션 저장
	    int random = (int) (Math.random() * 900000 + 100000);
	    session.setAttribute("certNo", String.valueOf(random));
	    session.setAttribute("email", email.trim().toLowerCase());

	    // 인증번호 이메일 발송
	    SimpleMailMessage message = new SimpleMailMessage();
	    message.setSubject("[SEOLLENEUN RESORT] 이메일 인증 번호");
	    message.setText("인증 번호: " + random);
	    message.setTo(email);
	    mailSender.send(message);

	    return "인증번호가 이메일로 발송되었습니다.";
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

	
	@Autowired
	private RoomService roomService;
    @Autowired
    private LiftService liftService;
    @Autowired
	private PackageService packageService;
    @Autowired
    private LockerService lockerService;
    
    
    @GetMapping("myPage.me")
    public String myPage(HttpSession session, Model model) {
        Member loginMember = (Member) session.getAttribute("loginMember");

        // 로그인 여부 확인
        if (loginMember == null) {
            return "redirect:/login.me";
        }

        int memberNo = loginMember.getMemberNo(); // 객실 및 패키지, 락커 예약 조회용
        String memberId = loginMember.getMemberId(); // 리프트 예약 조회용

        // 객실 예약 목록 조회
        ArrayList<RoomPay> reservedRooms = roomService.selectReservedRoomList(memberNo);
        int roomCount = roomService.countReservedRooms(memberNo);

        // 락커 예약 목록 조회
        ArrayList<LockerReservation> reservedLockers = lockerService.selectReservedLockerList(memberNo);
        int lockerCount = lockerService.countReservedLockers(memberNo);

        // 패키지 예약 목록 조회
        ArrayList<PackagePay> reservedPackages = packageService.selectReservedPackageList(memberNo);
        int packageCount = packageService.countReservedPackages(memberNo);

        // 리프트 예약 목록 조회
        ArrayList<LiftOrder> reservedLiftList = liftService.selectReservedLiftList(memberId);
        int liftCount = liftService.countReservedLifts(memberId);

        // Model에 데이터 추가
        model.addAttribute("reservedRooms", reservedRooms);
        model.addAttribute("roomCount", roomCount);
        model.addAttribute("reservedLockers", reservedLockers);
        model.addAttribute("lockerCount", lockerCount);
        model.addAttribute("reservedPackages", reservedPackages);
        model.addAttribute("packageCount", packageCount);
        model.addAttribute("reservedLiftList", reservedLiftList);
        model.addAttribute("liftCount", liftCount);

        return "mypage/myPage";
    }





/*
	@GetMapping("myPage.me")
	public String myPage() {
		
		return "mypage/myPage";
	}
	*/
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
	        return "redirect:/login.me";
	    }

	    String encPwd = loginMember.getMemberPwd();

	    System.out.println("입력된 비밀번호: " + memberPwd);
	    System.out.println("암호화된 비밀번호: " + encPwd);

	    // 입력된 비밀번호와 암호화된 비밀번호 비교
	    if (bcryptPasswordEncoder.matches(memberPwd, encPwd)) {
	        int result = memberService.deleteMember(memberId);

	        if (result > 0) {
	            session.removeAttribute("loginMember");
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
