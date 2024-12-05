package com.kh.ski.lift.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ski.lift.model.vo.Lift;
import com.kh.ski.lift.model.vo.LiftOrder;

@Repository
public class LiftDao {
	
	// 리프트권 목록 조회 DAO
	public ArrayList<Lift> selectLiftList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("liftMapper.selectLiftList");
	}
	
	// 리프트권 상세 조회 DAO
	public Lift selectLift(SqlSessionTemplate sqlSession, int liftNo) {
		return (Lift)sqlSession.selectOne("liftMapper.selectLift");
	}
	
	// 리프트권 주문 DAO
	public LiftOrder liftOrder(SqlSessionTemplate sqlSession, int liftNo) {
		return (LiftOrder)sqlSession.selectOne("liftMapper.liftOrder");
	}

	public LiftOrder orderLift(SqlSessionTemplate sqlSession, int liftNo) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
