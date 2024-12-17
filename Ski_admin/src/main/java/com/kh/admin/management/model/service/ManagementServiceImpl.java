package com.kh.admin.management.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.admin.management.model.dao.ManagementDao;
import com.kh.admin.management.model.vo.SkiResortOpen;
import com.kh.admin.management.model.vo.SlopeOpen;

@Service
public class ManagementServiceImpl implements ManagementService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ManagementDao managementDao;
	
	@Override
	public ArrayList<SkiResortOpen> selectSkiResort() {
		return managementDao.selectSkiResort(sqlSession);
	}

	@Override
	public ArrayList<SlopeOpen> selectSlope() {
		return managementDao.selectSlope(sqlSession);
	}

	@Override
	public int updateSkiResort(SkiResortOpen sro) {
		return managementDao.updateSkiResort(sqlSession, sro);
	}

	@Override
    public int updateSlope(ArrayList<SlopeOpen> slopeList) {
        return managementDao.updateSlope(sqlSession, slopeList);
    }
}
