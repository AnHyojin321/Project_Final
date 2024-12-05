package com.kh.ski.lift.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ski.lift.model.vo.Lift;
import com.kh.ski.lift.model.vo.LiftOrder;

public class LiftDao {
	
	// 리프트권 목록 조회 DAO
	public ArrayList<Lift> selectLiftList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectLiftList("liftMapper.selectLiftList");
	}
	
	// 리프트권 상세 조회 DAO
	public Lift selectLift(SqlSessionTemplate sqlSession, int liftNo) {
		return (Lift)sqlSession.selectLift("liftMapper.selectLift");
	}
	
	// 리프트권 주문 DAO
	public LiftOrder liftOrder(SqlSessionTemplate sqlSession, int liftNo) {
		return (LiftOrder)sqlSession.liftOrder("liftMapper.liftOrder");
	}
	
}
