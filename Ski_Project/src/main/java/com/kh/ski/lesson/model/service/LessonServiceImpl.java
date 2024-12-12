package com.kh.ski.lesson.model.service;


import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ski.common.model.vo.PageInfo;
import com.kh.ski.lesson.model.dao.LessonDao;
import com.kh.ski.lesson.model.vo.Lesson;

@Service
public class LessonServiceImpl implements LessonService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private LessonDao lessonDao;
	
	
	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return lessonDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Lesson> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return lessonDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertLesson(Lesson l) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Lesson selectLesson(int resNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateLesson(Lesson l) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteLesson(int resNo) {
		// TODO Auto-generated method stub
		return 0;
	}



}
