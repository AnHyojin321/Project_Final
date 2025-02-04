package com.kh.ski.lostitem.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ski.lostitem.model.vo.LostItem;

@Repository
public class LostItemDao {

    @Autowired
    private SqlSession sqlSession;

    // 전체 게시글 수 조회
    public int selectListCount() {
        return sqlSession.selectOne("lostItem.selectListCount");  // MyBatis 매퍼에서 전체 게시글 수 조회
    }

    public List<LostItem> selectLostListPaging(Map<String, Integer> paramMap) {
        return sqlSession.selectList("lostItem.selectLostListPaging", paramMap);  // MyBatis 매퍼에서 페이징된 게시물 조회
    }

    public LostItem selectLostItemDetail(SqlSession sqlSession, int lostNo) {
        return sqlSession.selectOne("lostItem.selectLostItemDetail", lostNo);
    }

    public int increaseViewCount(int lostNo) {
        return sqlSession.update("lostItem.increaseViewCount", lostNo);
    }

    // 필터링된 게시글 수 조회
    public int selectFilteredListCount(Map<String, Object> filterMap) {
        return sqlSession.selectOne("lostItem.selectFilteredListCount", filterMap); // 필터링 조건에 맞는 총 게시글 수 조회
    }

    // 필터링된 게시물 목록 조회
    public List<LostItem> selectFilteredLostList(Map<String, Object> filterMap) {
        return sqlSession.selectList("lostItem.selectFilteredLostList", filterMap); // 필터링 조건에 맞는 게시물 목록 조회
    }
}
