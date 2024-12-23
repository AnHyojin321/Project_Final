package com.kh.ski.locker.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.ski.locker.model.vo.Locker;
import com.kh.ski.locker.model.vo.LockerReservation;

public interface LockerService {
    List<Locker> getAllLockers();

    // 락커 결제 정보 insert
    int insertPayLocker(LockerReservation lr);
    // 김동준
    ArrayList<LockerReservation> selectReservedLockerList(int memberNo);
    LockerReservation findLockerReservationById(int lockerReservNo);

}
