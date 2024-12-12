package com.kh.ski.pack.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ski.common.model.vo.PageInfo;
import com.kh.ski.pack.model.vo.Pack;

@Repository
public class PackageDao {
	
	// 패키지 상품 갯수 조회
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("packageMapper.selectListCount");
	}
	
	// 패키지 목록 조회
	public ArrayList<Pack> selectPackageList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds 
				= new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("packageMapper.selectPackageList", null, rowBounds);
	}
	
	// 패키지 상품 상세 조회
	public Pack selectPackageDetail(SqlSessionTemplate sqlSession, int packageNo) {
		return sqlSession.selectOne("packageMapper.selectPackageDetail", packageNo);
	}
}
