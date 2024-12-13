package com.kh.ski.locker.model.dao;

import com.kh.ski.locker.model.vo.Locker;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LockerDao {

    public List<Locker> findAllLockers(SqlSessionTemplate sqlSession) {
        return sqlSession.selectList("locker.findAllLockers");
    }

    public Locker findLockerById(SqlSessionTemplate sqlSession, int lockerNo) {
        return sqlSession.selectOne("locker.findLockerById", lockerNo);
    }
}
