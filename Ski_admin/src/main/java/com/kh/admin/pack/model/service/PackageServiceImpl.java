package com.kh.admin.pack.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.admin.common.model.vo.PageInfo;
import com.kh.admin.pack.model.dao.PackageDao;
import com.kh.admin.pack.model.vo.Pack;

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
	
	
	// 패키지 상품 등록
	@Override
	@Transactional
	public int insertPackage(Pack p) {
		return packageDao.insertPackage(sqlSession, p);
	}
	
	// 패키지 상품 상세 조회
	@Override
	public Pack selectPackageDetail(int packageNo) {
		return packageDao.selectPackageDetail(sqlSession, packageNo);
	}
	
	// 패키지 상품 정보 수정 처리
	@Override
	public int updatePackage(Pack p) {
		return packageDao.updatePackage(sqlSession, p);
	}

}
