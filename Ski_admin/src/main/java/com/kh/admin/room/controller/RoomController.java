package com.kh.admin.room.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.admin.room.model.service.RoomService;
import com.kh.admin.room.model.vo.Room;
import com.kh.admin.room.model.vo.RoomImg;
import com.kh.admin.room.model.vo.RoomPay;

@Controller
public class RoomController {
	
	@Autowired
	private RoomService roomService;
	
	@GetMapping("list.ro")
	public ModelAndView selectRoomList(ModelAndView mv) {
		mv.setViewName("room/roomList");
		return mv;
	}

	
	// 객실 등록 페이지 요청
	@GetMapping("roomEnrollForm.ro")
	public ModelAndView enrollForm(ModelAndView mv) {
		mv.setViewName("room/roomEnrollForm");
		return mv;
	}
	
	
	// 객실 등록 요청
	@PostMapping("insert.ro")
	public ModelAndView insertRoom(Room r,
	                               MultipartFile[] upfiles,  // MultipartFile 배열로 변경
	                               HttpSession session,
	                               ModelAndView mv) {

	    // 첨부파일이 있는 경우 처리
	    if (upfiles != null && upfiles.length > 0) {
	        ArrayList<RoomImg> imgList = new ArrayList<RoomImg>();  // RoomImg 객체를 담을 리스트

	        // 첨부파일 처리
	        for (int i = 0; i < upfiles.length; i++) {
	            MultipartFile upfile = upfiles[i];
	            if (!upfile.isEmpty()) {  // 빈 파일이 아닐 경우에만 처리
	                // 파일명 출력
	                System.out.println("업로드된 파일명: " + upfile.getOriginalFilename());

	                // 파일 저장
	                String changeName = saveFile(upfile, session);

	                // RoomImg 객체 생성 및 정보 설정
	                RoomImg roomImg = new RoomImg();
	                roomImg.setRoomOriginName(upfile.getOriginalFilename());  // 원본 파일명
	                roomImg.setRoomChangeName("resources/uploadFiles/room/" + changeName);  // 저장된 파일명
	                roomImg.setRoomImgPath("resources/uploadFiles/room/");  // 파일 경로 설정

	                // 썸네일 이미지 처리
	                if (i == 0) {
	                    roomImg.setRoomThumbnail("Y");  // 첫 번째 파일은 썸네일 이미지로 설정
	                } else {
	                    roomImg.setRoomThumbnail("N");  // 나머지 파일들은 썸네일이 아님
	                }

	                // RoomImg 객체 리스트에 추가
	                imgList.add(roomImg);
	            }
	        }

	        // Room 객체와 RoomImg 리스트를 서비스에 전달
	        int result = roomService.insertRoom(r, imgList);  // Room과 RoomImg 리스트를 전달

	        if (result > 0) { // 성공
	        	
	            mv.setViewName("redirect:/list.ro");
	        } else { // 실패
	            mv.setViewName("common/errorPage");
	        }
	    }

	    return mv;
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
