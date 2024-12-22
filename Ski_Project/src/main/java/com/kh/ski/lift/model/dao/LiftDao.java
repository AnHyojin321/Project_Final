package com.kh.ski.lift.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ski.lift.model.vo.Lift;
import com.kh.ski.lift.model.vo.LiftOrder;

@Repository
public class LiftDao {
	
	public ArrayList<Lift> selectDayPass(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("lift.selectDayPass");
	}
	
	public ArrayList<Lift> selectSeasonPass(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("lift.selectSeasonPass");
	}

	// 리프트권 주문 DAO
	public int liftOrder(SqlSessionTemplate sqlSession, LiftOrder liftOrder) {
		return sqlSession.insert("lift.liftOrder", liftOrder);
	}

}
