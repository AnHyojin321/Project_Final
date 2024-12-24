package com.kh.ski.pack.model.service;

import java.util.ArrayList;

import com.kh.ski.common.model.vo.PageInfo;
import com.kh.ski.pack.model.vo.Pack;
import com.kh.ski.pack.model.vo.PackagePay;
import com.kh.ski.room.model.vo.RoomPay;

public interface PackageService {
	
	// 패키지 상품 갯수 조회용
	int selectListCount();
	
	// 패키지 목록 조회용
	ArrayList<Pack> selectPackageList(PageInfo pi);
	
	// 패키지 상품 상세 조회
	Pack selectPackageDetail(int packageNo);
	
	// 해당 패키지 상품의 이전 패키지 상품 조회
	Pack selectPrevPackage(int packageNo);
	
	// 해당 패키지 상품의 다음 패키지 상품 조회
	Pack selectNextPackage(int packageNo);
	
	// 패키지 구성별 상품 갯수
	int selectPackageSetCount(int packageSet);
	
	// 패키지 구성 번호별 패키지 상품 목록 조회
	ArrayList<Pack> selectPackageSet(int packageSet, PageInfo pi);
	
	// 패키지 상품 구매 정보 데이터 삽입
	int insertPayInfo(PackagePay pp);
	
	// 마이페에지에서 불러올 거
	ArrayList<PackagePay> selectReservedPackageList(int memberNo);
	
	// 예약한 패키지 목록 상세 조회
	PackagePay packageDetail(int packageReservNo);
	
	// 패키지 예약 갯수 조회
	int countReservedPackages(int memberNo);

}
