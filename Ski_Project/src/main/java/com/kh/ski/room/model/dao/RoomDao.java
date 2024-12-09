package com.kh.ski.room.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ski.room.model.vo.Room;
import com.kh.ski.room.model.vo.RoomImg;
import com.kh.ski.room.model.vo.RoomPay;

@Repository
public class RoomDao {
	
	public ArrayList<Room> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("roomMapper.selectList");
	}
	
	
	
	public ArrayList<Room> selectAvailableRoom(SqlSessionTemplate sqlSession, RoomPay rp) {
			System.out.println("dao호출되나");
		return (ArrayList)sqlSession.selectList("roomMapper.selectAvailableRoom", rp);
	}

	
	
}
