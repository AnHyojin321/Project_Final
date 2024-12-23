package com.kh.ski.lift.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ski.lift.model.dao.LiftDao;
import com.kh.ski.lift.model.vo.Lift;
import com.kh.ski.lift.model.vo.LiftOrder;
import com.kh.ski.lift.model.vo.LiftPay;

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
	
	
	@Override
	@Transactional
	public int insertLiftPay(LiftPay lp) {
		return liftDao.insertLiftPay(sqlSession, lp);
	}
	
	
// 김동준마이페ㅇ지
    @Override
    public ArrayList<LiftOrder> selectReservedLiftList(String memberId) {
        return liftDao.selectReservedLiftList(sqlSession, memberId);
    }
    @Override
    public LiftOrder selectLiftOrderByNo(int liftOrderNo) {
        return liftDao.selectLiftOrderByNo(sqlSession, liftOrderNo);
    }
    @Override
    public int countReservedLifts(String memberId) {
        return liftDao.countReservedLifts(sqlSession, memberId);
    }

}
