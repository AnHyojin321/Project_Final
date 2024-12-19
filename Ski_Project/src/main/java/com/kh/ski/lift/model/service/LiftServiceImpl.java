package com.kh.ski.lift.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ski.lift.model.dao.LiftDao;
import com.kh.ski.lift.model.vo.Lift;
import com.kh.ski.lift.model.vo.LiftOrder;

@Service
public class LiftServiceImpl implements LiftService{

	@Autowired
	private LiftDao liftDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Lift> selectDayPass() {
		return liftDao.selectDayPass(sqlSession);
	}
	
	@Override
	public ArrayList<Lift> selectSeasonPass() {
		return liftDao.selectSeasonPass(sqlSession);
	}

	@Override
	public int liftOrder(LiftOrder liftOrder) {
		return liftDao.liftOrder(sqlSession, liftOrder);
	}
		

}
