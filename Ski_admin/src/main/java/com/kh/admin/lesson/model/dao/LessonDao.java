package com.kh.admin.lesson.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.admin.lesson.model.vo.Lesson;

@Repository
public class LessonDao {

	
    // 강습 예약 리스트 조회
    public List<Lesson> selectAllLessons(SqlSessionTemplate sqlSession) {
        return sqlSession.selectList("lesson.selectAllLessons");
    }

    // 예약 상태 변경
    public int updateLessonStatus(SqlSessionTemplate sqlSession, int resNo, String lessonStatus) {
        Lesson lesson = new Lesson();
        lesson.setResNo(resNo);
        lesson.setLessonStatus(lessonStatus);
        return sqlSession.update("lesson.updateLessonStatus", lesson);
    }
}
