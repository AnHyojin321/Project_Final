package com.kh.admin.room.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.admin.common.model.vo.PageInfo;
import com.kh.admin.room.model.dao.RoomDao;
import com.kh.admin.room.model.vo.Room;
import com.kh.admin.room.model.vo.RoomImg;

@Service
public class RoomServiceImpl implements RoomService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private RoomDao roomDao;
	
	  // 객실 등록 요청 서비스
	  @Override
	  @Transactional
	    public int insertRoom(Room r, List<RoomImg> roomImgList) {
	        
	        int result1 = roomDao.insertRoom(sqlSession, r);

	        int result2 = roomDao.insertRoomImg(sqlSession, roomImgList);
	       
	        return result1*result2;
	    }
	  
	  // 객실 갯수 조회 서비스
	  @Override
	  public int selectListCount() {
		  return roomDao.selectListCount(sqlSession);
	  }
	  
	  // 객실 목록 조회 서비스
	  @Override
	  public ArrayList<Room> selectRoomList(PageInfo pi) {
		  return roomDao.selectRoomList(sqlSession, pi);
	  }
	  
	  // 객실 상세 조회 서비스
	  @Override
	  public Room selectRoomDetail(int roomNo) {
		  return roomDao.selectRoomDetail(sqlSession, roomNo);
	  }
	  
	  // 객실 정보 수정 서비스
	  @Override
	  @Transactional
	  public int updateRoom(Room r) {
		  return roomDao.updateRoom(sqlSession, r);
	  }


}
