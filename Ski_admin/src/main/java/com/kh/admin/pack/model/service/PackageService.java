package com.kh.admin.pack.model.service;

import java.util.ArrayList;

import com.kh.admin.pack.model.vo.Pack;

public interface PackageService {
	
	// 패키지 상품 목록 조회 서비스
	ArrayList<Pack> selectPackageList(Pack p);
	
	// 패키지 상품 등록 서비스
	int insertPackage(Pack p);
	
	// 패키지 상품 상세 조회
	Pack selectPackageDetail(int packageNo);

	
	// 패키지 상품 정보 수정
	int updatePackageForm(Pack p);

}
