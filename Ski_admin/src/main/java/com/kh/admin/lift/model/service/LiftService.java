package com.kh.admin.lift.model.service;

import java.util.ArrayList;

import com.kh.admin.lift.model.vo.Lift;

public interface LiftService {

	ArrayList<Lift> selectLift();

	int updateLift(ArrayList<Lift> liftList);

}
