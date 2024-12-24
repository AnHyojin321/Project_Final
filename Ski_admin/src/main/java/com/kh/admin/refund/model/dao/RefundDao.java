package com.kh.admin.refund.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RefundDao {

    @Autowired
    private SqlSession sqlSession;

    public List<Map<String, Object>> fetchLockerRefunds() {
        return sqlSession.selectList("refund.fetchLockerRefunds");
    }

    public List<Map<String, Object>> fetchPackageRefunds() {
        return sqlSession.selectList("refund.fetchPackageRefunds");
    }

    public List<Map<String, Object>> fetchLiftRefunds() {
        return sqlSession.selectList("refund.fetchLiftRefunds");
    }

    public List<Map<String, Object>> fetchRoomRefunds() {
        return sqlSession.selectList("refund.fetchRoomRefunds");
    }
}
