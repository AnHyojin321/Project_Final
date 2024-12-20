package com.kh.ski.lostitem.model.service;


import java.util.List;
import java.util.Map;

import com.kh.ski.lostitem.model.vo.LostItem;

public interface LostItemService {

    int selectListCount(); // 총 게시글 수 조회

    List<LostItem> selectLostListPaging(Map<String, Integer> paramMap); // 페이징된 게시물 목록 조회

    LostItem selectLostItemDetail(int lostNo); // 게시물 상세 정보 조회

    int increaseViewCount(int lostNo); // 조회수 증가
}
