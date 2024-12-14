package com.kh.ski.lift.model.service;

import java.util.ArrayList;

import com.kh.ski.lift.model.vo.Lift;
import com.kh.ski.lift.model.vo.LiftOrder;

public interface LiftService {
	
	// 일일권 조회 서비스
	Lift selectDayPass();
	
	// 시즌권 조회 서비스
	Lift selectSeasonPass();
	
    // 리프트권 주문요청 서비스
    LiftOrder liftOrder(int liftNo);
    
    // 결제 서비스 (결제 처리 및 완료 후 리프트권 발급 : 큐알 발급 후 큐알 찍으면 이미지나오게 ?)
    // int processPayment(int memberNo, int totalPrice);
    
}
