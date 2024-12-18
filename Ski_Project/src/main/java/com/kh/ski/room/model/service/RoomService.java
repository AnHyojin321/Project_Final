package com.kh.ski.room.model.service;

import java.util.ArrayList;

import com.kh.ski.member.model.vo.Member;
import com.kh.ski.room.model.vo.Room;
import com.kh.ski.room.model.vo.RoomPay;

public interface RoomService {
	
	ArrayList<Room> selectList();
	
	
	// 날짜별 이용가능한 객실 조회
	 ArrayList<Room> selectAvailableRoom(RoomPay rp);
	 
	 // 선택한 객실의 정보 조회
	 Room selectRoomDetails(int roomNo);
	 
	 // 예약 단계에서 로그인한 회원 정보 조회하기
	 Member selectMember(int memberNo);
	 
	 // 결제 완료 시 객실 상태 변경
	 int updateRoomStatus(int roomNo);
	 
	 // 결제 정보 데이터에 저장
	 int insertPayInfo(RoomPay rp);
}
