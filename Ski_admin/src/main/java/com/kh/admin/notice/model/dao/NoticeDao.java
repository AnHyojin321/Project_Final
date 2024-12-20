package com.kh.admin.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.admin.notice.model.vo.Notice;

@Repository
public class NoticeDao {

    @Autowired
    private SqlSession sqlSession;

    // 전체 게시글 수 조회
    public int selectListCount() {
        return sqlSession.selectOne("notice.selectListCount"); // MyBatis 매퍼에서 전체 게시글 수 조회
    }

    // 페이징된 게시물 목록 조회
    public List<Notice> selectNoticeListPaging(Map<String, Integer> paramMap) {
        return sqlSession.selectList("notice.selectNoticeListPaging", paramMap); // MyBatis 매퍼에서 페이징된 게시물 조회
    }

    // 공지사항 등록
    public int insertNotice(Notice notice) {
        return sqlSession.insert("notice.insertNotice", notice); // MyBatis 매퍼에서 공지사항 등록
    }

    // 공지사항 상세보기
    public Notice selectNoticeDetail(int noticeNo) {
        return sqlSession.selectOne("notice.selectNoticeDetail", noticeNo); // MyBatis 매퍼에서 공지사항 상세보기
    }

    public int updateNoticeNumbers(int noticeNo) {
        return sqlSession.update("notice.updateNoticeNumbers", noticeNo);
    }


    // 공지사항 삭제
    public int deleteNotice(int noticeNo) {
        return sqlSession.delete("notice.deleteNotice", noticeNo); // MyBatis 매퍼에서 공지사항 삭제
    }
    
    public int updateNotice(Notice notice) {
        return sqlSession.update("notice.updateNotice", notice);
    }

}
