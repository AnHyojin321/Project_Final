package com.kh.ski.locker.model.service;

import java.util.List;

import com.kh.ski.locker.model.vo.Locker;

public interface LockerService {

    List<Locker> getAllLockers();

    Locker getLockerById(int lockerNo);
}
