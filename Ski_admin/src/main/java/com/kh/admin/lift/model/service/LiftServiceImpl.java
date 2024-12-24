package com.kh.admin.lift.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.admin.common.model.vo.PageInfo;
import com.kh.admin.lift.model.dao.LiftDao;
import com.kh.admin.lift.model.vo.Lift;
import com.kh.admin.lift.model.vo.LiftPurchase;

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


	@Override
	public int selectListCount(String keyword, String liftLrefundStatus) {
        return liftDao.selectListCount(sqlSession, keyword, liftLrefundStatus);

	}


	@Override
	public List<LiftPurchase> selectLiftList(PageInfo pi, String keyword, String liftLrefundStatus) {
        return liftDao.selectLiftList(sqlSession, pi, keyword, liftLrefundStatus);
	}


}
