package com.kh.ski.lostitem.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ski.lostitem.model.dao.LostItemDao;
import com.kh.ski.lostitem.model.vo.LostItem;

@Service
public class LostItemServiceImpl implements LostItemService {

    @Autowired
    private LostItemDao lostItemDao;

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Override
    public int selectListCount() {
        return lostItemDao.selectListCount();  // DAO에서 총 게시글 수 조회
    }

    @Override
    public List<LostItem> selectLostListPaging(Map<String, Integer> paramMap) {
        return lostItemDao.selectLostListPaging(paramMap);  // 페이징된 게시물 목록 조회
    }

    @Override
    public LostItem selectLostItemDetail(int lostNo) {
        return lostItemDao.selectLostItemDetail(sqlSession, lostNo);
    }

    @Override
    public int increaseViewCount(int lostNo) {
        return lostItemDao.increaseViewCount(lostNo);
    }

    @Override
    public int selectFilteredListCount(Map<String, Object> filterMap) {
        return lostItemDao.selectFilteredListCount(filterMap); // 필터링된 총 게시글 수 조회
    }

    @Override
    public List<LostItem> selectFilteredLostList(Map<String, Object> filterMap) {
        return lostItemDao.selectFilteredLostList(filterMap); // 필터링된 게시물 목록 조회
    }
}
