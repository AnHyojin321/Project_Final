package com.kh.ski.room.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ski.member.model.vo.Member;
import com.kh.ski.room.model.dao.RoomDao;
import com.kh.ski.room.model.vo.Room;
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
	public ArrayList<Room> selectAvailableRoom(RoomPay rp) {
		return roomDao.selectAvailableRoom(sqlSession, rp);
	}
	
	// 예약하고자하는 객실의 수용인원 조회
	@Override
	public Room selectRoomDetails(int roomNo) {
		return roomDao.selectRoomDetails(sqlSession, roomNo);
	}
	
	// 예약단계에서 보여질 로그인한 회원의 정보 조회
	@Override
	public Member selectMember(int memberNo) {
		return roomDao.selectMember(sqlSession, memberNo);
	}
	
	// 결제 완료 시 객실 상태 변경
	@Override
	@Transactional
	public int updateRoomStatus(int roomNo) {
		return roomDao.updateRoomStatus(sqlSession, roomNo);
	}

	// 결제 정보 데이터 담기
	@Override
	@Transactional
	public int insertPayInfo(RoomPay rp) {
		return roomDao.insertPayInfo(sqlSession, rp);
	}

}

