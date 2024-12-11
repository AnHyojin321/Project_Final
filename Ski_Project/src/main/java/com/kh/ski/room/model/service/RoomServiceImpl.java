package com.kh.ski.room.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ski.room.model.dao.RoomDao;
import com.kh.ski.room.model.vo.Room;
import com.kh.ski.room.model.vo.RoomImg;
import com.kh.ski.room.model.vo.RoomPay;

@Service
public class RoomServiceImpl implements RoomService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private RoomDao roomDao;
	
	
	  @Override
	  public ArrayList<Room> selectList() {
		  return roomDao.selectList(sqlSession);
	  }
		
	
	  
	@Override
	public ArrayList<Room> selectAvailableRoom(RoomPay rp, String roomType) {
		return roomDao.selectAvailableRoom(sqlSession, rp, roomType);
	}
	
	// 예약하고자하는 객실의 수용인원 조회
	public Room selectRoomDetails(int roomNo) {
		return roomDao.selectRoomDetails(sqlSession, roomNo);
	}

}
