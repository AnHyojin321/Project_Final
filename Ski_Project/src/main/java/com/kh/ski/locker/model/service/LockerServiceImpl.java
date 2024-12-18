package com.kh.ski.locker.model.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ski.locker.model.dao.LockerDao;
import com.kh.ski.locker.model.vo.Locker;
import com.kh.ski.locker.model.vo.LockerReservation;

@Service
public class LockerServiceImpl implements LockerService {

    @Autowired
    private LockerDao lockerDao;

    @Override
    public List<Locker> getAllLockers() {
        return lockerDao.findAllLockers();
    }

    @Override
    @Transactional

    public boolean reserveLocker(int lockerNo, int memberNo, Date startDate, Date endDate) {
        System.out.println("서비스 호출: reserveLocker()");
        System.out.println("LockerNo: " + lockerNo + ", MemberNo: " + memberNo);

        Locker locker = lockerDao.findLockerById(lockerNo);
        if (locker == null) {
            System.out.println("해당 락커 정보를 찾을 수 없습니다.");
            return false; 
        }

        long days = (endDate.getTime() - startDate.getTime()) / (1000 * 60 * 60 * 24) + 1;
        int totalPrice = (int) (days * locker.getLockerPrice());

        LockerReservation reservation = new LockerReservation();
        reservation.setLockerNo(lockerNo);
        reservation.setMemberNo(memberNo);
        reservation.setLockerStartDate(startDate);
        reservation.setLockerEndDate(endDate);
        reservation.setLockerTotalPrice(totalPrice);
        reservation.setLockerPayCode("TEMP_PAY_CODE");
        reservation.setLockerPayToken("TEMP_PAY_TOKEN");

        System.out.println("예약 정보 확인: " + reservation);

        int result = lockerDao.insertLockerReservation(reservation);
        System.out.println("DB 삽입 결과: " + result);
        return result > 0;
    }

}
