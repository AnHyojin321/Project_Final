package com.kh.admin.lesson.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.admin.common.model.vo.PageInfo;
import com.kh.admin.lesson.model.vo.Lesson;

@Repository
public class LessonDao {

	
	public int selectListCount(SqlSessionTemplate sqlSession, String keyword, String resStatus) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("keyword", keyword);
	    params.put("resStatus", resStatus);
	    return sqlSession.selectOne("lesson.selectListCount", params);
	}

	public List<Lesson> selectLessonList(SqlSessionTemplate sqlSession, PageInfo pi, String keyword, String resStatus) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("keyword", keyword);
	    params.put("resStatus", resStatus);
	    
	    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
	    int limit = pi.getBoardLimit();
	    RowBounds rowBounds = new RowBounds(offset, limit);
	    return sqlSession.selectList("lesson.selectLessonList", params, rowBounds);
	}


    // 예약 상태 변경
    public int updateLessonStatus(SqlSessionTemplate sqlSession, int resNo, String resStatus) {
        Lesson lesson = new Lesson();
        lesson.setResNo(resNo);
        lesson.setResStatus(resStatus);
        return sqlSession.update("lesson.updateLessonStatus", lesson);
    }

}
