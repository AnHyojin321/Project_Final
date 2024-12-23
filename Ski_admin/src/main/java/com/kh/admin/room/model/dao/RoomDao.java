package com.kh.admin.room.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.admin.common.model.vo.PageInfo;
import com.kh.admin.room.model.vo.Room;
import com.kh.admin.room.model.vo.RoomImg;
import com.kh.admin.room.model.vo.RoomPay;

@Repository
public class RoomDao {
	
	// 객실 정보 등록 
	public int insertRoom(SqlSessionTemplate sqlSession, Room r) {
		return sqlSession.insert("roomMapper.insertRoom", r);
	}
	
	// 객실 첨부파일 등록
	public int insertRoomImg(SqlSessionTemplate sqlSession, List<RoomImg> ri) {
	    int result = 0;
	    
	    // RoomImg 리스트 길이만큼 반복하여 INSERT 쿼리 실행
	    for (RoomImg roomImg : ri) {
	        result += sqlSession.insert("roomMapper.insertRoomImg", roomImg);
	    }

	    // 삽입된 행 수 반환
	    return result;
	}
	
	// 객실 갯수 조회
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("roomMapper.selectListCount");
	}
	
	// 객실 목록 조회
	public ArrayList<Room> selectRoomList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds 
				= new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("roomMapper.selectRoomList", null, rowBounds);
	}
	
	// 객실 상세 조회
	public Room selectRoomDetail(SqlSessionTemplate sqlSession, int roomNo) {
		return sqlSession.selectOne("roomMapper.selectRoomDetail", roomNo);
	}
	
	// 객실 정보 수정 
	public int updateRoom(SqlSessionTemplate sqlSession, Room r) {
		return sqlSession.update("roomMapper.updateRoom", r);
	}

}
