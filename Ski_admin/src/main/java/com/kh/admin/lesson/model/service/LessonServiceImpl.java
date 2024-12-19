package com.kh.admin.lesson.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.admin.lesson.model.dao.LessonDao;
import com.kh.admin.lesson.model.vo.Lesson;

@Service
public class LessonServiceImpl implements LessonService {

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Autowired
    private LessonDao lessonDao;

    @Override
    public List<Lesson> selectAllLessons() {
        return lessonDao.selectAllLessons(sqlSession);
    }

    @Override
    @Transactional
    public int updateLessonStatus(int resNo, String lessonStatus) {
        return lessonDao.updateLessonStatus(sqlSession, resNo, lessonStatus);
    }
}
