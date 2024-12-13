package com.kh.ski.pack.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
		int boardLimit = 4;
		
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
	


	

}
