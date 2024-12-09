package com.kh.ski.room.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.ski.room.model.vo.Room;
import com.kh.ski.room.model.vo.RoomImg;
import com.kh.ski.room.model.vo.RoomPay;

public interface RoomService {
	
	ArrayList<Room> selectList();
	
	int insertRoom(Room r, List<RoomImg> roomImgList);
	
	// 날짜별 이용가능한 객실 조회
	 ArrayList<Room> selectAvailableRoom(RoomPay rp);
}
