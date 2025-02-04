package com.kh.admin.lostitem.model.service;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.admin.lostitem.model.dao.LostItemDao;
import com.kh.admin.lostitem.model.vo.LostItem;

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
    public int insertLostItem(LostItem lostItem) {
        return lostItemDao.insertLostItem(lostItem);
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
    public int deleteLostItem(int lostNo) {
        return lostItemDao.deleteLostItem(lostNo);
    }
}


