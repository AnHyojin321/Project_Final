package com.kh.ski.locker.model.dao;

import com.kh.ski.locker.model.vo.Locker;
import com.kh.ski.locker.model.vo.LockerReservation;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LockerDao {

    @Autowired
    private SqlSessionTemplate sqlSession; // SqlSessionTemplate 주입

    // 모든 락커 조회
    public List<Locker> findAllLockers() {
        return sqlSession.selectList("locker.findAllLockers");
    }
    public Locker findLockerById(int lockerNo) {
        Locker locker = sqlSession.selectOne("locker.findLockerById", lockerNo);
        System.out.println("조회된 락커 정보: " + locker);
        return locker;
    }


    public int insertLockerReservation(LockerReservation reservation) {
        System.out.println("예약 정보 삽입 시도: " + reservation);
        int result = sqlSession.insert("locker.insertLockerReservation", reservation);
        System.out.println("예약 정보 삽입 결과: " + result);
        return result;
    }

}
