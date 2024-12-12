package com.kh.ski.pack.model.service;

import java.util.ArrayList;

import com.kh.ski.common.model.vo.PageInfo;
import com.kh.ski.pack.model.vo.Pack;

public interface PackageService {
	
	// 패키지 상품 갯수 조회용
	int selectListCount();
	
	// 패키지 목록 조회용
	ArrayList<Pack> selectPackageList(PageInfo pi);
	
	// 패키지 상품 상세 조회
	Pack selectPackageDetail(int packageNo);

}
