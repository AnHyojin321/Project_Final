package com.kh.ski.lift.model.service;

import java.util.ArrayList;

import com.kh.ski.lift.model.vo.Lift;
import com.kh.ski.lift.model.vo.LiftOrder;
import com.kh.ski.lift.model.vo.LiftPay;
import com.kh.ski.member.model.vo.Member;
import com.kh.ski.room.model.vo.RoomPay;

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
    // 리프트 예약 상세 정보 조회
    LiftOrder selectLiftOrderByNo(int liftOrderNo);
    // 리프트 예약 갯수 조회
    int countReservedLifts(String memberId);

    
    // --- 마이페이지 환불처리
    // 구매 단계에서 로그인한 회원 정보 조회하기
	Member selectMember(String memberId);
	 
	// 구매한 리프트권 목록 조회
	ArrayList<LiftPay> selectPurchasedLiftList(String memberId);
	 
	// 구매한 리프트권 환불 처리
	int cancelLiftPurchase(int liftPurchaseNo);

	// QRCode 발급 처리
	int QRCode(int liftPurchaseNo);
    
}
