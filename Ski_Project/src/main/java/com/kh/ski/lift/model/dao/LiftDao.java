package com.kh.ski.lift.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ski.lift.model.vo.Lift;
import com.kh.ski.lift.model.vo.LiftOrder;
import com.kh.ski.lift.model.vo.LiftPay;

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
	// 리프트 일일권 구매
	public int insertLiftPay(SqlSessionTemplate sqlSession, LiftPay lp) {
		return sqlSession.insert("lift.insertLiftPay", lp);	
	}

	
	
	
// 김동준 마이페이지
    public ArrayList<LiftOrder> selectReservedLiftList(SqlSessionTemplate sqlSession, String memberId) {
        return (ArrayList) sqlSession.selectList("lift.selectReservedLiftList", memberId);
    }
}
