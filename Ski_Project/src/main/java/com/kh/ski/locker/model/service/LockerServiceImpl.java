package com.kh.ski.locker.model.service;

import java.util.Date;
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

}
