package com.kh.ski.lesson.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ski.common.model.vo.PageInfo;
import com.kh.ski.lesson.model.vo.Lesson;

@Repository
public class LessonDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("lesson.selectListCount");
	}

	public ArrayList<Lesson> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("lesson.selectList", null, rowBounds);
	}

	public int insertLesson(SqlSessionTemplate sqlSession, Lesson les) {
		
		return sqlSession.insert("lesson.insertLesson", les);
	}

	public Lesson selectLesson(SqlSessionTemplate sqlSession, int resNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("lesson.selectLesson", resNo);
	}

	public int updateLesson(SqlSessionTemplate sqlSession, Lesson les) {
		// TODO Auto-generated method stub
		return sqlSession.update("lesson.updateLesson", les);
	}

	public int deleteLesson(SqlSessionTemplate sqlSession, int resNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("lesson.deleteLesson", resNo);
	}

	
	
	
	
	
}
