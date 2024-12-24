package com.kh.admin.refund.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.admin.refund.model.dao.RefundDao;

@Service
public class RefundServiceImpl implements RefundService {

    @Autowired
    private RefundDao refundDao;

    @Override
    public List<Map<String, Object>> getLockerRefundItems() {
        return refundDao.fetchLockerRefunds();
    }

    @Override
    public List<Map<String, Object>> getPackageRefundItems() {
        return refundDao.fetchPackageRefunds();
    }

    @Override
    public List<Map<String, Object>> getLiftRefundItems() {
        return refundDao.fetchLiftRefunds();
    }

    @Override
    public List<Map<String, Object>> getRoomRefundItems() {
        return refundDao.fetchRoomRefunds();
    }
}
