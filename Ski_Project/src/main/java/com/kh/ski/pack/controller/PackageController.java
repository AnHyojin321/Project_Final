package com.kh.ski.pack.controller;

import java.util.ArrayList;
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

import com.kh.ski.common.model.vo.PageInfo;
import com.kh.ski.common.template.Pagination;
import com.kh.ski.member.model.vo.Member;
import com.kh.ski.pack.model.service.PackageService;
import com.kh.ski.pack.model.vo.Pack;
import com.kh.ski.pack.model.vo.PackagePay;
import com.kh.ski.room.model.service.RoomService;

/**
 * @author anhyojin
 *
 */
@Controller
public class PackageController {
	
	@Autowired
	private PackageService packageService;
	@Autowired
	private RoomService roomService;
	
	
	
	// 여기서부터 결제 관련 컨트롤러
	@PostMapping("storeSessionData.pk")
	@ResponseBody
	public Map<String, String> storeSessionData(
	        @RequestParam("memberNo") String memberNo,
	        @RequestParam("packageNo") String packageNo,
	        HttpSession session) {

	    // 세션에 데이터 저장
	    session.setAttribute("memberNo", memberNo);
	    session.setAttribute("packageNo", packageNo);
	    
	    System.out.println("세션에 담긴 데이터 조회");
	    System.out.println("memberNo : " + memberNo);
	    System.out.println("packageNo : " + packageNo);

	    // 성공 응답 반환
	    Map<String, String> response = new HashMap<>();
	    response.put("status", "success");
	    return response;
	}
	
	@PostMapping("payResult.pk")
	public String payResult(@RequestParam("authResultCode") String authResultCode,
	                        @RequestParam("authResultMsg") String authResultMsg,
	                        @RequestParam("tid") String tid,
	                        HttpSession session,
	                        Model model) {
		System.out.println("tid : " + tid);
	    // 세션에서 데이터 가져오기
	    String memberNo = (String) session.getAttribute("memberNo");
	    String packageNo = (String) session.getAttribute("packageNo");
	    
	    System.out.println("세션에서 가져온 데이터");
	    System.out.println("memberNo : " + memberNo);
	    System.out.println("packageNo : " + packageNo);

	    // 결제 결과 검증
	    if ("0000".equals(authResultCode)) {
	        model.addAttribute("tid", tid);
	        model.addAttribute("memberNo", memberNo);
	        model.addAttribute("packageNo", packageNo);

	        
	        return "pack/autoPostPackForm";
	    } else {
	        model.addAttribute("message", authResultMsg);
	        return "pack/payPackfail";
	    }
	}
	
	@PostMapping("/payConfirm.pk")
    public ModelAndView payConfirm(PackagePay pp,
    								ModelAndView mv) {

            
            int result = packageService.insertPayInfo(pp);
            
            if(result > 0) {
            	// 성공 시 결과 페이지로 이동
            	mv.setViewName("pack/payPacksuccess");
            } else {
            	// 오류 발생 시 실패 페이지로 이동
            	mv.setViewName("pack/payPackfail");
            }

        return mv;
    }
	// 여기까지 결제 관련 컨트롤러


	/**
	 * 패키지 상품 목록 조회
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@GetMapping("list.pk")
	public String selectPackageList(@RequestParam(value="cpage", defaultValue="1")int currentPage,
									Model model) {
		
		int listCount = packageService.selectListCount();
		int pageLimit = 5;
		int boardLimit = 12;
		
		PageInfo pi 
			= Pagination.getPageInfo(listCount, currentPage, 
									 pageLimit, boardLimit);
		
		ArrayList<Pack> list = packageService.selectPackageList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "pack/packageList";
		
	}
	
	/**
	 * 패키지 상품 상세 정보 조회
	 * @param pno
	 * @param mv
	 * @return
	 */
	@GetMapping("package/{packageNo}")
	public ModelAndView selectPackageDetail(@PathVariable(value="packageNo")int pno,
											ModelAndView mv) {
		// 패키지 상품 정보 조회
		Pack p = packageService.selectPackageDetail(pno);
		// 해당 패키지 상품의 이전 상품글 조회용
		Pack prev = packageService.selectPrevPackage(pno);
		// 해당 패키지 상품의 다음 상품글 조회용
		Pack next = packageService.selectNextPackage(pno);
		
		
		mv.addObject("p", p)
		  .addObject("prev", prev)
		  .addObject("next", next)
		  .setViewName("pack/packageDetail");
		
		return mv;
	}
	

	/**
	 * 패키지 구성 번호에 따른 패키지 상품 조회
	 * @param currentPage
	 * @param packageSet
	 * @param model
	 * @return
	 */
	@GetMapping("packageList.pk")
	public String selectPackageSet(@RequestParam(value="cpage", defaultValue="1")int currentPage,
							       int packageSet,
								   Model model) {
		
		int listCount = packageService.selectPackageSetCount(packageSet);
		int pageLimit = 5;
		int boardLimit = 4;
		
		PageInfo pi 
			= Pagination.getPageInfo(listCount, currentPage, 
									 pageLimit, boardLimit);
		
		ArrayList<Pack> list = packageService.selectPackageSet(packageSet, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "pack/packageSetList";
		
	}
	
	
	/**
	 * 패키지 구매자 정보 및 패키지 정보 조회
	 */
	@PostMapping("packPayInfo.pk")
	public ModelAndView selectPackagePayInfo(int memberNo, int packageNo, ModelAndView mv) {
		
		Pack p = packageService.selectPackageDetail(packageNo);
		
		Member m = roomService.selectMember(memberNo);
		
		mv.addObject("p", p)
		  .addObject("m", m)
		  .setViewName("pack/packagePayStep");
		return mv;
	}
	


	

}
