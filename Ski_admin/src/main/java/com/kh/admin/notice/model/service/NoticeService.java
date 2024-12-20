package com.kh.admin.notice.model.service;

import java.util.List;
import java.util.Map;

import com.kh.admin.notice.model.vo.Notice;

public interface NoticeService {

    int selectListCount(); // 전체 게시글 수 조회

    List<Notice> selectNoticeListPaging(Map<String, Integer> paramMap); // 페이징된 게시물 목록 조회

    // 공지사항 등록
    int insertNotice(Notice notice);

    // 공지사항 상세보기
    Notice selectNoticeDetail(int noticeNo);
    	
    
    //공지사항 수정
    int updateNotice(Notice notice);

    // 공지사항 삭제
    int deleteNotice(int noticeNo);
}
