package com.kh.ski.locker.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.ski.locker.model.vo.Locker;
import com.kh.ski.locker.model.vo.LockerReservation;
public interface LockerService {
    List<Locker> getAllLockers();

    // 락커 결제 정보 insert
    int insertPayLocker(LockerReservation lr);



    // 특정 회원의 락커 예약 정보 조회
    List<LockerReservation> getReservationsByMemberNo(int memberNo);

    // 김동준
    ArrayList<LockerReservation> selectReservedLockerList(int memberNo);
    LockerReservation findLockerReservationById(int lockerReservNo);
    int countReservedLockers(int memberNo);

    int updateRefundStatus(int lockerReservNo);

}