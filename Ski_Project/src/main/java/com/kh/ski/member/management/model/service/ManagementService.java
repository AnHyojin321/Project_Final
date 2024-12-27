package com.kh.ski.management.model.service;

import java.util.ArrayList;

import com.kh.ski.management.model.vo.SkiResortOpen;
import com.kh.ski.management.model.vo.SlopeOpen;

public interface ManagementService {
	
	ArrayList<SkiResortOpen> selectSkiResort();
	
	ArrayList<SlopeOpen> selectSlope();
	
}
