package com.kh.admin.pack.model.service;

import java.util.ArrayList;

import com.kh.admin.common.model.vo.PageInfo;
import com.kh.admin.member.model.vo.Member;
import com.kh.admin.pack.model.vo.Pack;
import com.kh.admin.pack.model.vo.PackagePay;

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
	
	// 패키지 예약 내역 갯수 조회
	int selectReservedListCount();
	
	// 패키지 예약 내역 목록 조회
	ArrayList<PackagePay> selectpackageReservedList(PageInfo pi);

	
	// 패키지 예약한 회원 정보 조회
	Member selectMember(int memberNo);
	
	// 패키지 예약 내역 상세 조회
	PackagePay selectPackagePayDetail(int packageReservNo);
	
	// 패키지 예약 내역 조회 - 필터링(환불상태여부)
	// ArrayList<PackagePay> selectFilter(String prefundStatus);


}
