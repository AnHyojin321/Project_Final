package com.kh.admin.pack.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.admin.common.model.vo.PageInfo;
import com.kh.admin.member.model.vo.Member;
import com.kh.admin.pack.model.vo.Pack;
import com.kh.admin.pack.model.vo.PackagePay;

@Repository
public class PackageDao {
	
	// 패키지 상품 갯수 조회
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("packageMapper.selectListCount");
	}
	
	// 패키지 상품 목록 조회용
	public ArrayList<Pack> selectPackageList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds 
				= new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("packageMapper.selectPackageList", null, rowBounds);
	}
	
	// 패키지 상품 등록용
	public int insertPackage(SqlSessionTemplate sqlSession, Pack p) {
		return sqlSession.insert("packageMapper.insertPackage", p);
	}
	
	// 패키지 상품 상세 조회
	public Pack selectPackageDetail(SqlSessionTemplate sqlSession, int packageNo) {
		return sqlSession.selectOne("packageMapper.selectPackageDetail", packageNo);
	}
	
	// 패키지 상품 정보 수정 처리
	public int updatePackage(SqlSessionTemplate sqlSession, Pack p) {
		System.out.println("dao 호출되나?");
		return sqlSession.update("packageMapper.updatePackage", p);
	}
	
	// 패키지 상품 삭제
	public int deletePackage(SqlSessionTemplate sqlSession, int packageNo) {
		return sqlSession.update("packageMapper.deletePackage", packageNo);
	}
	
	// 패키지 상품 예약 내역 갯수 조회
	public int selectReservedListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("packageMapper.selectReservedListCount");
	}
	
	// 패키지 상품 예약 내역 목록 조회
	public ArrayList<PackagePay> selectpackageReservedList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds 
				= new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("packageMapper.selectpackageReservedList", null, rowBounds);
	}
<<<<<<< Updated upstream
	
	// 패키지 예약자 정보 조회
	public Member selectMember(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("packageMapper.selectMember", memberNo);
	}
	
	
	// 패키지 예약 내역 상세 조회
	public PackagePay selectPackagePayDetail(SqlSessionTemplate sqlSession, int packageReservNo) {
		return sqlSession.selectOne("packageMapper.selectPackagePayDetail", packageReservNo);
	}
=======
>>>>>>> Stashed changes


}
