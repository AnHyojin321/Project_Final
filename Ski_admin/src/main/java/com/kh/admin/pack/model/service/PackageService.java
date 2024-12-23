package com.kh.admin.pack.model.service;

import java.util.ArrayList;

import com.kh.admin.common.model.vo.PageInfo;
import com.kh.admin.pack.model.vo.Pack;

public interface PackageService {
	
	// 패키지 상품 갯수 조회
	int selectListCount();
	
	// 패키지 상품 목록 조회 서비스
	ArrayList<Pack> selectPackageList(PageInfo pi);
	
	// 패키지 상품 등록 서비스
	int insertPackage(Pack p);
	
	// 패키지 상품 상세 조회
	Pack selectPackageDetail(int packageNo);
	
	// 패키지 상품 정보 수정 처리
	int updatePackage(Pack p);
	
	// 패키지 상품 삭제
	int deletePackage(int packageNo);

}
