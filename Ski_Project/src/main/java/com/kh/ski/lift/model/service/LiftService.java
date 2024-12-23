package com.kh.ski.lift.model.service;

import java.util.ArrayList;

import com.kh.ski.lift.model.vo.Lift;
import com.kh.ski.lift.model.vo.LiftOrder;
import com.kh.ski.lift.model.vo.LiftPay;

public interface LiftService {
	
	// 일일권 조회 서비스
	ArrayList<Lift> selectDayPass();
	
	// 시즌권 조회 서비스
	ArrayList<Lift> selectSeasonPass();
	
    // 리프트권 주문요청 서비스
    int liftOrder(LiftOrder liftOrder);
    
    // 리프트 일일권 구매
    int insertLiftPay(LiftPay lp);
    
    
// 김동준 마이페이지
    ArrayList<LiftOrder> selectReservedLiftList(String memberId);
}
