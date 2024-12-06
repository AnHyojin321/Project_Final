package com.kh.admin.room.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.admin.room.model.vo.Room;
import com.kh.admin.room.model.vo.RoomImg;

public interface RoomService {
	
	ArrayList<Room> selectList();
	
	int insertRoom(Room r, List<RoomImg> roomImgList);
}
