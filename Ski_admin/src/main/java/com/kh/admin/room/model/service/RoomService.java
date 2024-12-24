package com.kh.admin.room.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.admin.common.model.vo.PageInfo;
import com.kh.admin.room.model.vo.Room;
import com.kh.admin.room.model.vo.RoomImg;
import com.kh.admin.room.model.vo.RoomPay;

public interface RoomService {
	
	// 객실 등록 요청 
	int insertRoom(Room r, List<RoomImg> roomImgList);
	
	// 객실 갯수 조회
	int selectListCount();
	
	// 객실 목록 조회
	ArrayList<Room> selectRoomList(PageInfo pi);
	
	// 객실 상세 조회
	Room selectRoomDetail(int roomNo);
	
	
	// 객실 정보 수정
	int updateRoom(Room r);
	
	// 예약 객실 총 개수 조회
	int selectRoomCount(String keyword, String RrefundStatus);
	
	// 예약 객실 조회
	List<RoomPay> selectRoomReservList(PageInfo pi, String keyword, String rRefundStatus);

}
