package com.kh.ski.management.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ski.management.model.vo.SkiResortOpen;
import com.kh.ski.management.model.vo.SlopeOpen;

@Repository
public class ManagementDao {

	public ArrayList<SkiResortOpen> selectSkiResort(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("management.selectSkiResort");
	}

	public ArrayList<SlopeOpen> selectSlope(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("management.selectSlope");
	}
}
