package com.kh.ski.locker.model.service;

import com.kh.ski.locker.model.dao.LockerDao;
import com.kh.ski.locker.model.vo.Locker;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
    public Locker getLockerById(int lockerNo) {
        return lockerDao.findLockerById(sqlSession, lockerNo);
    }
}
