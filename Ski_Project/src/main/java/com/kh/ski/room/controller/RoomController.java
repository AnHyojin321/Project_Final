package com.kh.ski.room.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ski.member.model.vo.Member;
import com.kh.ski.room.model.service.RoomService;
import com.kh.ski.room.model.vo.Room;
import com.kh.ski.room.model.vo.RoomPay;

@Controller
public class RoomController {
	
	@Autowired
	private RoomService roomService;
	
	@PostMapping("storeSessionData.ro")
	@ResponseBody
	public Map<String, String> storeSessionData(
	        @RequestParam("memberNo") String memberNo,
	        @RequestParam("roomNo") String roomNo,
	        @RequestParam("checkInDate") String checkInDate,
	        @RequestParam("checkOutDate") String checkOutDate,
	        @RequestParam("totalPrice") String totalPrice,
	        HttpSession session) {

	    // 세션에 데이터 저장
	    session.setAttribute("memberNo", memberNo);
	    session.setAttribute("roomNo", roomNo);
	    session.setAttribute("checkInDate", checkInDate);
	    session.setAttribute("checkOutDate", checkOutDate);
	    session.setAttribute("totalPrice", totalPrice);


	    // 성공 응답 반환
	    Map<String, String> response = new HashMap<>();
	    response.put("status", "success");
	    return response;
	}
	
	@PostMapping("payResult.ro")
	public String payResult(@RequestParam("authResultCode") String authResultCode,
	                        @RequestParam("authResultMsg") String authResultMsg,
	                        @RequestParam("tid") String tid,
	                        HttpSession session,
	                        Model model) {

	    // 세션에서 데이터 가져오기
	    String memberNo = (String) session.getAttribute("memberNo");
	    String roomNo = (String) session.getAttribute("roomNo");
	    String checkInDate = (String) session.getAttribute("checkInDate");
	    String checkOutDate = (String) session.getAttribute("checkOutDate");
	    String totalPrice = (String) session.getAttribute("totalPrice");

	    // 결제 결과 검증
	    if ("0000".equals(authResultCode)) {
	        model.addAttribute("tid", tid);
	        model.addAttribute("memberNo", memberNo);
	        model.addAttribute("roomNo", roomNo);
	        model.addAttribute("checkInDate", checkInDate);
	        model.addAttribute("checkOutDate", checkOutDate);
	        model.addAttribute("totalPrice", totalPrice);

	        return "room/autoPostForm";
	    } else {
	        model.addAttribute("message", authResultMsg);
	        return "room/payfail";
	    }
	}
	
	@PostMapping("/payConfirm.ro")
    public ModelAndView payConfirm(RoomPay rp,
    								ModelAndView mv) {

            // 요청된 데이터 출력 (개발 확인용)
            System.out.println("TID: " + rp.getTid());
            System.out.println("Member No: " + rp.getMemberNo());
            System.out.println("Room No: " + rp.getRoomNo());
            System.out.println("Check-In: " + rp.getCheckInDate());
            System.out.println("Check-Out: " + rp.getCheckOutDate());
            System.out.println("Total Price: " + rp.getTotalPrice());
            
            int roomNo = rp.getRoomNo();
            
            int result1 = roomService.updateRoomStatus(roomNo);
            int result2 = roomService.insertPayInfo(rp);
            
            if(result1*result2 > 0) {
            	// 성공 시 결과 페이지로 이동
            	mv.setViewName("room/paysuccess");
            } else {
            	// 오류 발생 시 실패 페이지로 이동
            	mv.setViewName("room/payfail");
            }

        return mv;
    }

	


	
	
	// 객실 목록 페이지 요청
	@GetMapping("list.ro")
	public String selectList(Model model) {
		
		ArrayList<Room> list = roomService.selectList();
		model.addAttribute("list", list);
		return "room/roomList";
		
	}
	
	// 객실 상세 페이지 - 스탠다드
	@GetMapping("roomDetail.ro")
	public ModelAndView roomDetail(@RequestParam("roomType") String roomType, 
								   ModelAndView mv,
								   HttpSession session) {
		
		Member loginMember = (Member) session.getAttribute("loginMember");
	    System.out.println(loginMember);
	    
	    mv.addObject("loginMember", loginMember);
		
	    if ("standard".equals(roomType)) {
	        mv.setViewName("room/standardDetail");
	    }else if("suite".equals(roomType)) {
	    	mv.setViewName("room/sutieDetail");
	    } else {
	    	mv.setViewName("room/deluxeDetail");
	    }
	    return mv;
	}

	
	
	// 객실 등록 페이지 요청
	@GetMapping("roomEnrollForm.ro")
	public ModelAndView enrollForm(ModelAndView mv) {
		mv.setViewName("room/roomEnrollForm");
		return mv;
	}
	
	
	
	// 객실 예약 페이지 요청 - step1
	@RequestMapping(value="payStep1.ro")
	public ModelAndView reservPayStep(@RequestParam("roomType") String roomType, 
									  int memberNo,
									  ModelAndView mv) {
		System.out.println("회원번호 : " + memberNo);

	    System.out.println("선택한 객실 타입: " + roomType);
	    
	    // 선택한 객실 타입 데이터를 JSP로 전달
	    mv.addObject("memberNo", memberNo);
	    mv.addObject("roomType", roomType);
	    mv.setViewName("room/roomPayStep1");

	    return mv;
	}

	
	
	// 날짜별 이용가능한 객실 조회
	@ResponseBody
	@PostMapping(value = "searchRoom.ro", produces = "application/json; charset=UTF-8")
	public ArrayList<Room> selectAvailableRoom(RoomPay rp, String roomType) {
	    System.out.println("호출되나???????");
	    System.out.println("------------------------");
	    System.out.println("체크인 날짜: " + rp.getCheckInDate());
	    System.out.println("체크아웃 날짜: " + rp.getCheckOutDate());
	    System.out.println("객실 타입 : " + roomType);
	    
	     ArrayList<Room> list = roomService.selectAvailableRoom(rp, roomType);
	    System.out.println("조회해온 객실 : " + list);
	     return list;
	}
	
	
	// 이용가능한 객실 선택 후 예약자 정보 입력 받는 페이지로 요청
	@PostMapping(value="payStep2.ro")
	public ModelAndView reservInfoInput(@RequestParam("roomNo") int roomNo, 
									    @RequestParam("checkInDate") String checkInDate, 
									    @RequestParam("checkOutDate") String checkOutDate, 
									    @RequestParam("memberNo") int memberNo,
									    ModelAndView mv) {
	    System.out.println("선택한 객실 번호: " + roomNo);
	    System.out.println("체크인 : " + checkInDate);
	    System.out.println("체크아웃 : " + checkOutDate);
	    
	    Member m = roomService.selectMember(memberNo);
	   
		Room r = null;
		r = roomService.selectRoomDetails(roomNo);
	    
	    // 날짜 형식 지정
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

	    // 문자열 날짜를 LocalDate로 변환
	    LocalDate checkIn = LocalDate.parse(checkInDate, formatter);
	    LocalDate checkOut = LocalDate.parse(checkOutDate, formatter);

	    // 숙박일 수 계산
	    long days = ChronoUnit.DAYS.between(checkIn, checkOut);
	    
	    // 데이터를 ModelAndView에 추가
	    mv.addObject("m", m);
	    mv.addObject("roomNo", roomNo);
	    mv.addObject("checkInDate", checkInDate);
	    mv.addObject("checkOutDate", checkOutDate);
	    mv.addObject("stayDays", days);
	    mv.addObject("r", r);
	    System.out.println(r);
	    mv.setViewName("room/roomPayStep2");

	    return mv;
	}
	
	// 전화번호, 투숙인원 응답데이터 받아와서 최종 예약자 정보 출력하기
	@PostMapping("payStep3.ro")
	public String processPayStep3(@RequestParam("memberNo") int memberNo,
								  @RequestParam("phone") String phone,
	                              @RequestParam("adult") int adult,
	                              @RequestParam("child") int child,
	                              @RequestParam("roomNo") int roomNo,
	                              @RequestParam("checkInDate") String checkInDate,
	                              @RequestParam("checkOutDate") String checkOutDate,
	                              @RequestParam("stayDays") String stayDays,
	                              Model model) {
	    // 받은 데이터 출력 (디버깅용)
	    System.out.println("전화번호: " + phone);
	    System.out.println("성인 투숙 인원: " + adult);
	    System.out.println("어린이 투숙 인원: " + child);
	    System.out.println("객실번호 : " + roomNo);
	    System.out.println("체크인 : " + checkInDate);
	    System.out.println("체크아웃 : " + checkOutDate);
	    System.out.println("숙박일 : " + stayDays);
	    
	    Member m = roomService.selectMember(memberNo);
	    
	     Room r = null;
		 r = roomService.selectRoomDetails(roomNo);

	    // 받은 데이터를 다음 페이지에 전달
		model.addAttribute("m", m);
	    model.addAttribute("phone", phone);
	    model.addAttribute("adult", adult);
	    model.addAttribute("child", child);
	    model.addAttribute("checkInDate", checkInDate);
	    model.addAttribute("checkOutDate", checkOutDate);
	    model.addAttribute("stayDays", stayDays);
	    model.addAttribute("r", r);
	    
 

	    // 다음 페이지로 이동
	    return "room/roomPayStep3"; // JSP 또는 Thymeleaf 뷰 파일 이름
	}


	
	
	
	// ----- 일반메소드 -----
	
	public String saveFile(MultipartFile upfile,
						   HttpSession session) {
		
		// 1. 원본파일명 얻어오기
		String originName = upfile.getOriginalFilename();
		// 예) bono.jpg
		
		// 2. 현재 시간을 년월일시분초로 뽑아내기
		// "yyyyMMddHHmmss" > SimpleDateFormat 객체 활용
		String currentTime 
				= new SimpleDateFormat("yyyyMMddHHmmss")
										.format(new Date());
		
		// 3. 뒤에 붙을 5자리 랜덤수 뽑아내기
		// 10000 ~ 99999 까지 총 90000 개의 숫자 중 한개
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		// 4. 원본파일명으로부터 확장자명 뽑아오기
		String ext 
			= originName.substring(originName.lastIndexOf("."));
		
		// 5. 모두 이어 붙이기
		String changeName = currentTime + ranNum + ext;
		// 예) "2024111817010112345.jpg"
		
		// 기존 cos.jar 는 파일명 수정 후 서버로 자동 업로드까지
		// 한번에 해줬었음!!
		// commons-fileupload, commons-io 는
		// 서버로 자동 업로드를 안해줌!! (보안 상 더 권장)
		
		// 6. 업로드 하고자 하는 서버의 물리적인 경로 알아내기
		// > applicationScope 객체를 이용해서 얻어낸다.
		String savePath 
				= session.getServletContext()
					.getRealPath("/resources/uploadFiles/room");
		
		// 7. 경로와 수정파일명을 합체 후 파일을 업로드해주기
		// (업로드 하는 구문을 내가 직접 작성해야함)
		// MultipartFile 객체에서 제공하는 transferTo 메소드를 활용
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IOException e) {
			e.printStackTrace();
		}

		return changeName;
	}
	
	
	

}
