package com.kh.admin.lesson.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.admin.common.model.vo.PageInfo;
import com.kh.admin.lesson.model.dao.LessonDao;
import com.kh.admin.lesson.model.vo.Lesson;

@Service
public class LessonServiceImpl implements LessonService {

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Autowired
    private LessonDao lessonDao;

    // 페이징 처리: 총 강습 예약 수 조회
    @Override
    public int selectLessonCount() {
        return lessonDao.selectLessonCount(sqlSession);
    }

    // 페이징 처리: 페이징된 강습 리스트 조회
    @Override
    public List<Lesson> selectLessonList(PageInfo pi) {
        return lessonDao.selectLessonList(sqlSession, pi);
    }
    
    
    @Override
    public List<Lesson> selectAllLessons() {
        return lessonDao.selectAllLessons(sqlSession);
    }

    @Override
    @Transactional
    public int updateLessonStatus(int resNo, String resStatus) {
        System.out.println("Service에서 전달된 값 - resNo: " + resNo + ", resStatus: " + resStatus);
        return lessonDao.updateLessonStatus(sqlSession, resNo, resStatus);
    }

}
