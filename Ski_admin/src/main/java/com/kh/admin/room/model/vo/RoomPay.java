package com.kh.admin.room.model.vo;

import java.sql.Date;

public class RoomPay {
	
	private int roomReservNo;
	private int roomTotalPrice;
	private Date checkInDate;
	private Date checkOutDate;
	private Date reservDate;
	private String request;
	private String roomPayCode;
	private String roomPayToken;
	private String payStatus;
	private String packRoomUsed;
	private String rRefundStatus;
	private Date rRefundate;
	
	public RoomPay() {}

	public RoomPay(int roomReservNo, int roomTotalPrice, Date checkInDate, Date checkOutDate, Date reservDate,
			String request, String roomPayCode, String roomPayToken, String payStatus, String packRoomUsed,
			String rRefundStatus, Date rRefundate) {
		super();
		this.roomReservNo = roomReservNo;
		this.roomTotalPrice = roomTotalPrice;
		this.checkInDate = checkInDate;
		this.checkOutDate = checkOutDate;
		this.reservDate = reservDate;
		this.request = request;
		this.roomPayCode = roomPayCode;
		this.roomPayToken = roomPayToken;
		this.payStatus = payStatus;
		this.packRoomUsed = packRoomUsed;
		this.rRefundStatus = rRefundStatus;
		this.rRefundate = rRefundate;
	}

	public int getRoomReservNo() {
		return roomReservNo;
	}

	public void setRoomReservNo(int roomReservNo) {
		this.roomReservNo = roomReservNo;
	}

	public int getRoomTotalPrice() {
		return roomTotalPrice;
	}

	public void setRoomTotalPrice(int roomTotalPrice) {
		this.roomTotalPrice = roomTotalPrice;
	}

	public Date getCheckInDate() {
		return checkInDate;
	}

	public void setCheckInDate(Date checkInDate) {
		this.checkInDate = checkInDate;
	}

	public Date getCheckOutDate() {
		return checkOutDate;
	}

	public void setCheckOutDate(Date checkOutDate) {
		this.checkOutDate = checkOutDate;
	}

	public Date getReservDate() {
		return reservDate;
	}

	public void setReservDate(Date reservDate) {
		this.reservDate = reservDate;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String getRoomPayCode() {
		return roomPayCode;
	}

	public void setRoomPayCode(String roomPayCode) {
		this.roomPayCode = roomPayCode;
	}

	public String getRoomPayToken() {
		return roomPayToken;
	}

	public void setRoomPayToken(String roomPayToken) {
		this.roomPayToken = roomPayToken;
	}

	public String getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	public String getPackRoomUsed() {
		return packRoomUsed;
	}

	public void setPackRoomUsed(String packRoomUsed) {
		this.packRoomUsed = packRoomUsed;
	}

	public String getrRefundStatus() {
		return rRefundStatus;
	}

	public void setrRefundStatus(String rRefundStatus) {
		this.rRefundStatus = rRefundStatus;
	}

	public Date getrRefundate() {
		return rRefundate;
	}

	public void setrRefundate(Date rRefundate) {
		this.rRefundate = rRefundate;
	}

	@Override
	public String toString() {
		return "RoomPay [roomReservNo=" + roomReservNo + ", roomTotalPrice=" + roomTotalPrice + ", checkInDate="
				+ checkInDate + ", checkOutDate=" + checkOutDate + ", reservDate=" + reservDate + ", request=" + request
				+ ", roomPayCode=" + roomPayCode + ", roomPayToken=" + roomPayToken + ", payStatus=" + payStatus
				+ ", packRoomUsed=" + packRoomUsed + ", rRefundStatus=" + rRefundStatus + ", rRefundate=" + rRefundate
				+ "]";
	};
	
	
	
}
