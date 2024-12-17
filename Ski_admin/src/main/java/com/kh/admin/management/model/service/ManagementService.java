package com.kh.admin.management.model.service;

import java.util.ArrayList;

import com.kh.admin.management.model.vo.SkiResortOpen;
import com.kh.admin.management.model.vo.SlopeOpen;

public interface ManagementService {

	ArrayList<SkiResortOpen> selectSkiResort();
	
	ArrayList<SlopeOpen> selectSlope();

	int updateSkiResort(SkiResortOpen sro);

	int updateSlope(ArrayList<SlopeOpen> slopeList);
	
}
