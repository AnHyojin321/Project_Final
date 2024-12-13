package com.kh.ski.pack.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ski.common.model.vo.PageInfo;
import com.kh.ski.pack.model.dao.PackageDao;
import com.kh.ski.pack.model.vo.Pack;

@Service
public class PackageServiceImpl implements PackageService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private PackageDao packageDao;
	
	// 패키지 상품 갯수 조회
	@Override
	public int selectListCount() {
		return packageDao.selectListCount(sqlSession);
	}
	
	// 패키지 상품 목록 조회
	@Override
	public ArrayList<Pack> selectPackageList(PageInfo pi) {
		return packageDao.selectPackageList(sqlSession, pi);
	}
	
	// 패키지 상품 상세 조회
	@Override
	public Pack selectPackageDetail(int packageNo) {
		return packageDao.selectPackageDetail(sqlSession, packageNo);
	}
	
	// 해당 패키지 상품의 이전 패키지 상품 조회
	@Override
	public Pack selectPrevPackage(int packageNo) {
		return packageDao.selectPrevPackage(sqlSession, packageNo);
	}
	
	// 해당 패키지 상품의 다음 패키지 상품 조회
	@Override
	public Pack selectNextPackage(int packageNo) {
		return packageDao.selectNextPackage(sqlSession, packageNo);
	}
	
	@Override
	public int selectPackageSetCount(int packagetSet) {
		return packageDao.selectPackageSetCount(sqlSession, packagetSet);
	}
	
	// 패키지 구성 번호에 따른 패키지 상품 목록 조회
	@Override
	public ArrayList<Pack> selectPackageSet(int packageSet, PageInfo pi) {
		return packageDao.selectPackageSet(sqlSession, packageSet, pi);
	}

}
