package com.kh.ski.locker.model.service;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ski.locker.model.dao.LockerDao;
import com.kh.ski.locker.model.vo.Locker;
import com.kh.ski.locker.model.vo.LockerReservation;

@Service
public class LockerServiceImpl implements LockerService {

	@Autowired
	private SqlSessionTemplate sqlSession;
   

    @Autowired
    private LockerDao lockerDao;

    
    @Override
    public List<Locker> getAllLockers() {
        return lockerDao.findAllLockers(sqlSession);
    }
    
    @Override
    @Transactional
    public int insertPayLocker(LockerReservation lr) {
    	return lockerDao.insertPayLocker(sqlSession, lr);
    }
 // 김동준	
    @Override
    public ArrayList<LockerReservation> selectReservedLockerList(int memberNo) {
        return lockerDao.findLockerReservationsByMemberNo(sqlSession, memberNo);
    }
    // 김동준	
    @Override
    public LockerReservation findLockerReservationById(int lockerReservNo) {
        return lockerDao.findLockerReservationById(sqlSession, lockerReservNo);
    }
 // 김동준	
    @Override
    public int countReservedLockers(int memberNo) {
        return lockerDao.countReservedLockers(sqlSession, memberNo);
    }
 
    @Override
    public List<LockerReservation> getReservationsByMemberNo(int memberNo) {
        return lockerDao.findReservationsByMemberNo(sqlSession, memberNo);
    }
    
    @Override
    @Transactional
    public int updateRefundStatus(int lockerReservNo) {
        System.out.println("[DEBUG] updateRefundStatus 호출됨, lockerReservNo: " + lockerReservNo);
        return lockerDao.updateRefundStatus(sqlSession, lockerReservNo);
    }


}