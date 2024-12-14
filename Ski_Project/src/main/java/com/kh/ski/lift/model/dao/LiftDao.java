package com.kh.ski.lift.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ski.lift.model.vo.Lift;
import com.kh.ski.lift.model.vo.LiftOrder;

@Repository
public class LiftDao {
	
	public Lift selectDayPass(SqlSessionTemplate sqlSession) {
		return (Lift)sqlSession.selectList("liftMapper.selectDayPass");
	}
	
	public Lift selectSeasonPass(SqlSessionTemplate sqlSession) {
		return (Lift)sqlSession.selectList("liftMapper.selectSeasonPass");
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
