package com.kh.ski.room.model.service;

import java.util.ArrayList;

import com.kh.ski.member.model.vo.Member;
import com.kh.ski.room.model.vo.Room;
import com.kh.ski.room.model.vo.RoomPay;

public interface RoomService {
	
	ArrayList<Room> selectList();
	
	
	// 날짜별 이용가능한 객실 조회
	 ArrayList<Room> selectAvailableRoom(RoomPay rp, String roomType);
	 
	 // 선택한 객실의 정보 조회
	 Room selectRoomDetails(int roomNo);
	 
	 // 예약 단계에서 로그인한 회원 정보 조회하기
	 Member selectMember(int memberNo);
}
