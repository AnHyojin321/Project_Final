package com.kh.admin.management.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.admin.management.model.vo.SkiResortOpen;
import com.kh.admin.management.model.vo.SlopeOpen;

@Repository
public class ManagementDao {

	public ArrayList<SkiResortOpen> selectSkiResort(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("management.selectSkiResort");
	}

	public ArrayList<SlopeOpen> selectSlope(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("management.selectSlope");
	}

	public int updateSkiResort(SqlSessionTemplate sqlSession, SkiResortOpen sro) {
		return sqlSession.update("management.updateSkiResort", sro);
	}

	public int updateSlope(SqlSessionTemplate sqlSession, ArrayList<SlopeOpen> slopeList) {
	    return sqlSession.update("management.updateSlope", slopeList);
	}
}
