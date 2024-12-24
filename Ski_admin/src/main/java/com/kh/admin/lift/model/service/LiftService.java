package com.kh.admin.lift.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.admin.common.model.vo.PageInfo;
import com.kh.admin.lift.model.vo.Lift;
import com.kh.admin.lift.model.vo.LiftPurchase;

public interface LiftService {

	ArrayList<Lift> selectLift();

	int updateLift(ArrayList<Lift> liftList);

	int selectListCount(String keyword, String liftLrefundStatus);
	
	List<LiftPurchase> selectLiftList(PageInfo pi, String keyword, String liftLrefundStatus);

}
