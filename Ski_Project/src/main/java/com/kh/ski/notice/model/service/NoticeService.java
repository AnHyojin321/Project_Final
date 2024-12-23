package com.kh.ski.notice.model.service;

import java.util.List;
import java.util.Map;

import com.kh.ski.notice.model.vo.Notice;

public interface NoticeService {

    int selectListCount(); // 전체 게시글 수 조회

    List<Notice> selectNoticeListPaging(Map<String, Integer> paramMap); // 페이징된 게시물 목록 조회

    // 공지사항 상세보기
    Notice selectNoticeDetail(int noticeNo);
    	
    Notice selectPrevNotice(int noticeNo); // 이전 게시글 조회
    Notice selectNextNotice(int noticeNo); // 다음 게시글 조회

  
}
