package com.kh.admin.room.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.admin.room.model.vo.Room;
import com.kh.admin.room.model.vo.RoomImg;
import com.kh.admin.room.model.vo.RoomPay;

public interface RoomService {
	

	int insertRoom(Room r, List<RoomImg> roomImgList);
	
}
