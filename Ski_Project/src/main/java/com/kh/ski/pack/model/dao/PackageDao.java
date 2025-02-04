package com.kh.ski.pack.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ski.common.model.vo.PageInfo;
import com.kh.ski.pack.model.vo.Pack;
import com.kh.ski.pack.model.vo.PackagePay;

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
	
	// 해당 패키지 상품의 이전 패키지 상품글 조회
	public Pack selectPrevPackage(SqlSessionTemplate sqlSession, int packageNo) {
		return sqlSession.selectOne("packageMapper.selectPrevPackage", packageNo);
	}
	
	// 해당 패키지 상품의 다음 패키지 상품글 조회
	public Pack selectNextPackage(SqlSessionTemplate sqlSession, int packageNo) {
		return sqlSession.selectOne("packageMapper.SelectNextPackage", packageNo);
	}
	
	// 패키지 구성 번호에 따른 패키지 상품 목록 조회
	public ArrayList<Pack> selectPackageSet(SqlSessionTemplate sqlSession, int packageSet, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds 
				= new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("packageMapper.selectPackageSet", packageSet , rowBounds);
	}
	
	// 패키지 구성별 상품 갯수
	public int selectPackageSetCount(SqlSessionTemplate sqlSession, int packageSet) {
		return sqlSession.selectOne("packageMapper.selectPackageSetCount", packageSet);
	}
	
	// 패키지 구매 정보 테이블에 데이터 추가
	public int insertPayInfo(SqlSessionTemplate sqlSession, PackagePay pp) {
		return sqlSession.insert("packageMapper.insertPayInfo", pp);
	}
	public ArrayList<PackagePay> selectReservedPackageList(SqlSessionTemplate sqlSession, int memberNo) {
	    return (ArrayList) sqlSession.selectList("packageMapper.selectReservedPackageList", memberNo);
	}

	public PackagePay packageDetail(SqlSessionTemplate sqlSession, int packageReservNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("packageMapper.packageDetail", packageReservNo);
	}

	public int countReservedPackages(SqlSessionTemplate sqlSession, int memberNo) {
	    return sqlSession.selectOne("packageMapper.countReservedPackages", memberNo);
	}
	
	// 패키지 구매 내역 목록조회 - 안효진
	public ArrayList<PackagePay> selectMyPackage(SqlSessionTemplate sqlSession, int member) {
		return (ArrayList)sqlSession.selectList("packageMapper.selectMyPackage", member);
	}
	
	// 패키지 환불 
	public int cancelMyPackage(SqlSessionTemplate sqlSession, int packageReserveNo) {
		return sqlSession.update("packageMapper.cancelMyPackage", packageReserveNo);
	}
	
	// 패키지 티켓 조회
	public PackagePay selectTicket(SqlSessionTemplate sqlSession, int packageReservNo) {
		return sqlSession.selectOne("packageMapper.selectTicket", packageReservNo);
	}

}
