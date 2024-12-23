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


    @Override
    public int selectListCount(String keyword, String resStatus) {
        return lessonDao.selectListCount(sqlSession, keyword, resStatus);
    }

    @Override
    public List<Lesson> selectLessonList(PageInfo pi, String keyword, String resStatus) {
        return lessonDao.selectLessonList(sqlSession, pi, keyword, resStatus);
    }


    @Override
    public int updateLessonStatus(int resNo, String resStatus) {
        return lessonDao.updateLessonStatus(sqlSession, resNo, resStatus);
    }

}
