package com.kh.ski.pack.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ski.common.model.vo.PageInfo;
import com.kh.ski.common.template.Pagination;
import com.kh.ski.pack.model.service.PackageService;
import com.kh.ski.pack.model.vo.Pack;

@Controller
public class PackageController {
	
	@Autowired
	private PackageService packageService;
	
	
	// 패키지 상품 목록 조회
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

	

}
