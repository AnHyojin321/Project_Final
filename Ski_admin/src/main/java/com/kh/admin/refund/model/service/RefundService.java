package com.kh.admin.refund.model.service;

import java.util.List;
import java.util.Map;

public interface RefundService {
	   List<Map<String, Object>> getLockerRefundItems();
	    List<Map<String, Object>> getPackageRefundItems();
	    List<Map<String, Object>> getLiftRefundItems();
	    List<Map<String, Object>> getRoomRefundItems();
}
