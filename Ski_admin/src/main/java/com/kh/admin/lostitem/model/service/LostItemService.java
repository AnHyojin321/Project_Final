package com.kh.admin.lostitem.model.service;

import java.util.List;
import java.util.Map;

import com.kh.admin.lostitem.model.vo.LostItem;

public interface LostItemService {

    int selectListCount();  // 전체 게시글 수 조회

    List<LostItem> selectLostListPaging(Map<String, Integer> paramMap); // 페이징된 게시물 목록 조회

    // 분실물 등록
    int insertLostItem(LostItem lostItem);

    LostItem selectLostItemDetail(int lostNo);

    // 조회수 증가
    int increaseViewCount(int lostNo);
    
    
    int deleteLostItem(int lostNo);

}
