package com.kh.admin.pack.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.admin.pack.model.service.PackageService;
import com.kh.admin.pack.model.vo.Pack;

@Controller
public class PackageController {
	
	@Autowired
	private PackageService packageService;
	
	// 패키지 목록 페이지 요청
	@GetMapping("packageList.pk")
	public ModelAndView selectPackageList(Pack p, ModelAndView mv) {
		
		ArrayList<Pack> list = packageService.selectPackageList(p);
		
		mv.addObject("list", list);
		mv.setViewName("pack/packageList");
		return mv;
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
	       // session.setAttribute("alertMsg", "패키지 등록 성공");
	        mv.setViewName("redirect:/packageList.pk"); // 리스트 페이지로 리다이렉트
	    } else { // 실패
	    	System.out.println("패키지 상픔 등록 실패");
	      //  mv.addObject("errorMsg", "패키지 등록 실패")
	      //    .setViewName("common/errorPage");
	    }

	    return mv;
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
