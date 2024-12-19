package com.kh.admin.lift.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.admin.lift.model.dao.LiftDao;
import com.kh.admin.lift.model.vo.Lift;

@Service
public class LiftServiceImpl implements LiftService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private LiftDao liftDao;
	
	
	@Override
	public ArrayList<Lift> selectLift() {
		return liftDao.selectLift(sqlSession);
	}


	@Override
	public int updateLift(ArrayList<Lift> liftList) {
		return liftDao.updateLift(sqlSession, liftList);
	}


}
