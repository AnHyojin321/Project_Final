package com.kh.admin.lesson.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.admin.common.model.vo.PageInfo;
import com.kh.admin.lesson.model.vo.Lesson;

@Repository
public class LessonDao {

	
    // 강습 예약 리스트 조회
    public List<Lesson> selectAllLessons(SqlSessionTemplate sqlSession) {
        return sqlSession.selectList("lesson.selectAllLessons");
    }

    // 예약 상태 변경
    public int updateLessonStatus(SqlSessionTemplate sqlSession, int resNo, String resStatus) {
        Lesson lesson = new Lesson();
        lesson.setResNo(resNo);
        lesson.setResStatus(resStatus); // resStatus를 정확히 설정
        System.out.println("DAO에서 전달된 값 - resNo: " + resNo + ", resStatus: " + resStatus);
        return sqlSession.update("lesson.updateLessonStatus", lesson);
    }
    
    public int selectLessonCount(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("lesson.selectListCount");
    }

    // 페이징 처리: 페이징된 강습 리스트 조회
    public List<Lesson> selectLessonList(SqlSessionTemplate sqlSession, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        int limit = pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, limit);
        return sqlSession.selectList("lesson.selectLessonList", null, rowBounds);
    }

}
