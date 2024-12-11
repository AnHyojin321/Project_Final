package com.kh.admin.pack.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.admin.pack.model.vo.Pack;

@Repository
public class PackageDao {
	
	// 패키지 상품 목록 조회용
	public ArrayList<Pack> selectPackageList(SqlSessionTemplate sqlSession, Pack p) {
		return (ArrayList)sqlSession.selectList("packageMapper.selectPackageList", p);
	}
	
	// 패키지 상품 등록용
	public int insertPackage(SqlSessionTemplate sqlSession, Pack p) {
		return sqlSession.insert("packageMapper.insertPackage", p);
	}

}
