package com.kh.ski.notice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ski.notice.model.dao.NoticeDao;
import com.kh.ski.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeDao noticeDao;

    @Override
    public int selectListCount() {
        return noticeDao.selectListCount(); // DAO에서 총 게시글 수 조회
    }

    @Override
    public List<Notice> selectNoticeListPaging(Map<String, Integer> paramMap) {
        return noticeDao.selectNoticeListPaging(paramMap); // 페이징된 게시물 목록 조회
    }

  

    @Override
    public Notice selectNoticeDetail(int noticeNo) {
        return noticeDao.selectNoticeDetail(noticeNo); // 공지사항 상세보기 조회
    }

  
    @Override
    public Notice selectPrevNotice(int noticeNo) {
        return noticeDao.selectPrevNotice(noticeNo);
    }

    @Override
    public Notice selectNextNotice(int noticeNo) {
        return noticeDao.selectNextNotice(noticeNo);
    }


}
