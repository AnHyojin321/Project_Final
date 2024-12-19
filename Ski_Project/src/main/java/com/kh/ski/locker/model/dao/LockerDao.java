package com.kh.ski.locker.model.dao;

import com.kh.ski.locker.model.vo.Locker;
import com.kh.ski.locker.model.vo.LockerReservation;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LockerDao {



    // 모든 락커 조회
    public List<Locker> findAllLockers(SqlSessionTemplate sqlSession) {
        return sqlSession.selectList("locker.findAllLockers");
    }
    
    public Locker findLockerById(SqlSessionTemplate sqlSession, int lockerNo) {
        Locker locker = sqlSession.selectOne("locker.findLockerById", lockerNo);
        System.out.println("조회된 락커 정보: " + locker);
        return locker;
    }


    // 락커 결제 정보 insert
    public int insertPayLocker(SqlSessionTemplate sqlSession, LockerReservation lr) {
    	return sqlSession.insert("locker.insertPayLocker", lr);
    }

}
