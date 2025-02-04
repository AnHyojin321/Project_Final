package com.kh.ski.locker.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
   
    public ArrayList<LockerReservation> findLockerReservationsByMemberNo(SqlSessionTemplate sqlSession, int memberNo) {
        return (ArrayList) sqlSession.selectList("locker.findLockerReservationsByMemberNo", memberNo);
    }
    public LockerReservation findLockerReservationById(SqlSessionTemplate sqlSession, int lockerReservNo) {
        return sqlSession.selectOne("locker.findLockerReservationById", lockerReservNo);
    }
    public int countReservedLockers(SqlSessionTemplate sqlSession, int memberNo) {
        return sqlSession.selectOne("locker.countReservedLockers", memberNo);
    }


    // 특정 회원의 락커 예약 정보 조회
    public List<LockerReservation> findReservationsByMemberNo(SqlSessionTemplate sqlSession, int memberNo) {
        return sqlSession.selectList("locker.findReservationsByMemberNo", memberNo);
    }
    
    public int updateRefundStatus(SqlSessionTemplate sqlSession, int lockerReservNo) {
        System.out.println("[DEBUG] DAO에서 받은 lockerReservNo: " + lockerReservNo);
        int result = sqlSession.update("locker.updateRefundStatus", lockerReservNo);
        System.out.println("[DEBUG] update 결과: " + result);
        return result;
    }



}