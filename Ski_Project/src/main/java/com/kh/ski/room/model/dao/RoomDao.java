package com.kh.ski.room.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ski.member.model.vo.Member;
import com.kh.ski.room.model.vo.Room;
import com.kh.ski.room.model.vo.RoomPay;

@Repository
public class RoomDao {
	
	public ArrayList<Room> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("roomMapper.selectList");
	}
	
	
	// Map을 사용하여 파라미터 전달
	public ArrayList<Room> selectAvailableRoom(SqlSessionTemplate sqlSession, RoomPay rp) {
	    return (ArrayList) sqlSession.selectList("roomMapper.selectAvailableRoom", rp);
	}
	
	// 선택된 객실의 수용인원 조회
	public Room selectRoomDetails(SqlSessionTemplate sqlSession, int roomNo) {
		return sqlSession.selectOne("roomMapper.selectRoomDetails", roomNo);
	}
	
	
	// 예약 단계에서 보여질 회원의 정보 조회
	public Member selectMember(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("roomMapper.selectMember", memberNo);
	}
	
	// 결제 완료 시 객실 상태 변경
	public int updateRoomStatus(SqlSessionTemplate sqlSession, int roomNo) {
		return sqlSession.update("roomMapper.updateRoomStatus", roomNo);
	}
	
	// 결제 정보 태이블에 데이터 담기
	public int insertPayInfo(SqlSessionTemplate sqlSession, RoomPay rp) {
		return sqlSession.insert("roomMapper.insertPayInfo", rp);
	}

 
	
}
