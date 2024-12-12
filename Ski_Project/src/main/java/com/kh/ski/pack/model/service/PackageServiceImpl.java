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

}
