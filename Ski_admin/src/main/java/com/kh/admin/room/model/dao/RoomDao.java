package com.kh.admin.room.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.admin.room.model.vo.Room;
import com.kh.admin.room.model.vo.RoomImg;

@Repository
public class RoomDao {
	
	public ArrayList<Room> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("roomMapper.selectList");
	}
	
	
	public int insertRoom(SqlSessionTemplate sqlSession, Room r) {
		return sqlSession.insert("roomMapper.insertRoom", r);
	}
	
	public int insertRoomImg(SqlSessionTemplate sqlSession, List<RoomImg> ri) {
	    int result = 0;
	    
	    // RoomImg 리스트 길이만큼 반복하여 INSERT 쿼리 실행
	    for (RoomImg roomImg : ri) {
	        result += sqlSession.insert("roomMapper.insertRoomImg", roomImg);
	    }

	    // 삽입된 행 수 반환
	    return result;
	}

	
	
}
