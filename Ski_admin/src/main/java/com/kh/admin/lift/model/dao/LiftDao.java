package com.kh.admin.lift.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.admin.lift.model.vo.Lift;
import com.kh.admin.management.model.vo.SlopeOpen;

@Repository
public class LiftDao {

	public ArrayList<Lift> selectLift(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("lift.selectLift");
	}
	
	public int updateLift(SqlSessionTemplate sqlSession, ArrayList<Lift> liftList) {
		return sqlSession.update("lift.updateLift", liftList);
	}

}
