package com.kh.admin.pack.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.admin.common.model.vo.PageInfo;
import com.kh.admin.common.template.Pagination;
import com.kh.admin.member.model.vo.Member;
import com.kh.admin.pack.model.service.PackageService;
import com.kh.admin.pack.model.vo.Pack;
import com.kh.admin.pack.model.vo.PackagePay;

@Controller
public class PackageController {
	
	@Autowired
	private PackageService packageService;
	
	// 패키지 목록 페이지 요청
	@GetMapping("list.pk")
	public String selectPackageList(@RequestParam(value="cpage", defaultValue="1")int currentPage,
									Pack p,
									Model model) {
		
		int listCount = packageService.selectListCount();
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Pack> list = packageService.selectPackageList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "pack/packageList";
	}

	// 패키지 등록 페이지 요청
	@GetMapping("packEnrollForm.pk")
	public ModelAndView packEnrollForm(ModelAndView mv) {
		mv.setViewName("pack/packEnrollForm");
		return mv;
	}
	
	
	// 패키지 상품 등록 요청
	@PostMapping("insertPackage.pk")
	public ModelAndView insertPackage(Pack p,
							  MultipartFile upfile,
							  HttpSession session,
							  ModelAndView mv) {
		
		  // 1. 첨부파일이 있을 경우 처리
	    if (!upfile.getOriginalFilename().equals("")) {
	        // 파일 저장 메서드 호출
	        String changeName = saveFile(upfile, session);

	        // Package 객체에 파일 정보 설정
	        p.setPackOriginName(upfile.getOriginalFilename());
	        p.setPackChangeName(changeName);
	        p.setPackImgPath("resources/uploadFiles/" + changeName);
	    }

	    // 2. 패키지 등록 서비스 호출
	    int result = packageService.insertPackage(p); // 서비스 메서드 구현 필요

	    // 3. 결과에 따른 처리
	    if (result > 0) { // 성공
	    	// System.out.println("패키지상품 등록 성공");
	        session.setAttribute("alertMsg", "패키지 등록 성공");
	        mv.setViewName("redirect:/list.pk"); // 리스트 페이지로 리다이렉트
	    } else { // 실패
	    	System.out.println("패키지 상픔 등록 실패");
	      //  mv.addObject("errorMsg", "패키지 등록 실패")
	      //    .setViewName("common/errorPage");
	    }

	    return mv;
	}
	
	// 패키지 상품 상세 정보 조회
	@GetMapping("package/{packageNo}")
	public ModelAndView selectPackageDetail(@PathVariable(value="packageNo")int pno,
											ModelAndView mv) {
		Pack p = packageService.selectPackageDetail(pno);
		
		//
		mv.addObject("p", p)
		  .setViewName("pack/packageDetail");
		
		return mv;
	}
	
	@PostMapping("updateForm.pk")
	public String updateFOrm(int pno, Model model) {
		Pack p = packageService.selectPackageDetail(pno);
		model.addAttribute("p", p);
		return "pack/packageUpdateForm";
	}
	
	
	/**
	 * 패키지 상품 수정 요청 처리
	 * @return 
	 */
	@PostMapping("update.pk")
	public String updatePackageInfo(Pack p
								, Model model
							    , HttpSession session
							    , MultipartFile reupfile) {
		if(!reupfile.getOriginalFilename().equals("")) {
			
			// 1. 기존에 첨부파일이 있었을 경우
			//    서버로부터 기존의 첨부파일을 찾아서 삭제시켜주기
			if(p.getPackOriginName() != null) {
				System.out.println("기존 첨부파일 Origin Name: " + p.getPackOriginName());
				String realPath 
					= session.getServletContext()
							 .getRealPath(p.getPackChangeName());
				
				new File(realPath).delete();
			}
			
			
			String changeName = saveFile(reupfile, session);
			 System.out.println("새로 업로드된 Origin Name: " + reupfile.getOriginalFilename());
			p.setPackOriginName(reupfile.getOriginalFilename());
			p.setPackChangeName(changeName);
	        p.setPackImgPath("resources/uploadFiles/" + changeName);
			
		}
		int result = packageService.updatePackage(p);
		System.out.println("result : " + result);
		
		System.out.println("Package No: " + p.getPackageNo());
		System.out.println("Pack Origin Name: " + p.getPackOriginName());
		System.out.println("Pack Change Name: " + p.getPackChangeName());
		System.out.println("Pack Image Path: " + p.getPackImgPath());

		if(result > 0) { // 수정 성공
			
			// 일회성 알람 문구를 담아
			// 해당 게시글의 상세보기 페이지로 url 재요청
			session.setAttribute("alertMsg", "게시글 수정 성공");
			
			// 게시글 상세조회 요청 처리를 Path Variable 방식으로 했으므로..
			return "redirect:/package/" + p.getPackageNo();
			
		} else { // 수정 실패
			
			// 에러 문구를 담아서 에러페이지로 포워딩
			model.addAttribute("errorMsg", "게시글 수정 실패");
			
			return "common/errorPage";
		}
		
	}
	
	/**
	 * 패키지 상품 삭제
	 */
	@PostMapping("deletePackage.pk")
	public String deletePackage(int pno, HttpSession session) {
		
		System.out.println("패키지 상품 삭제 컨트롤러 호출됨");
		System.out.println("패키지 상품 삭제할 번호 : " + pno);
		
		int result = packageService.deletePackage(pno);
		
		if(result > 0) {
			System.out.println("패키지 삭제 성공");
			session.setAttribute("alertMsg", "패키지 상품이 성공적으로 삭제되었습니다.");
		}else {
			System.out.println("패키지 삭제 실패");
		}
		return "redirect:/list.pk";
	}
	
	// 패키지 예약 내역 목록 조회
	@GetMapping("packReservList.pk")
	public String selectPackageReservedList(@RequestParam(value="cpage", defaultValue="1")int currentPage,
													Model model) {

		int listCount = packageService.selectReservedListCount();
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<PackagePay> list = packageService.selectpackageReservedList(pi);
		
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "pack/reservedList";
		
	}

	
	// 예약 내역 상세 조회
	@ResponseBody
	@GetMapping("packageReservDetail.pk") 
	public Map<String, Object> selectPackageReservedDetail(@RequestParam("packageReservNo")int packageReservNo
										  , @RequestParam("memberNo") int memberNo) {
		System.out.println("패키지 예약 내역 상세 조회 컨트롤러 호출됨");
		System.out.println("패키지 예약 번호 : " + packageReservNo);
		System.out.println("회원 번호 : " + memberNo);
		
		// 회원정보 조회
		Member m = packageService.selectMember(memberNo);
		
		// 패키지 예약 정보 조회
		PackagePay p = packageService.selectPackagePayDetail(packageReservNo);
		
		Map<String, Object> response = new HashMap<>();
	    response.put("m", m);
	    response.put("p", p);
	    
	    return response;
	}
	
	// 패키지 예약 내역 조회 - 환불여부
	@GetMapping("filterReservations.pk")
	public void selectFilter(@RequestParam(value="prefundStatus")String prefundStatus) {
		System.out.println("패키지 예약 내역 환불 조회 컨트롤러 호출");
		System.out.println("환불상태여부 : " + prefundStatus);
		
		// ArrayList<PackagePay> list = packageService.selectFilter(prefundStatus);
		
	}


		
	
	
	
	// ----- 일반메소드 -----
	public String saveFile(MultipartFile upfile, HttpSession session) {
	    String originName = upfile.getOriginalFilename();
	    String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	    int ranNum = (int) (Math.random() * 90000 + 10000);
	    String ext = originName.substring(originName.lastIndexOf("."));
	    String changeName = currentTime + ranNum + ext;
	
	    String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
	
	    try {
	        upfile.transferTo(new File(savePath + changeName));
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	
	    return changeName;
	}

}
