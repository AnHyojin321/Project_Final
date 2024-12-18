package com.kh.ski.locker.model.service;

import java.util.Date;
import java.util.List;
import com.kh.ski.locker.model.vo.Locker;

public interface LockerService {
    List<Locker> getAllLockers();

    boolean reserveLocker(int lockerNo, int memberNo, Date startDate, Date endDate);
}
