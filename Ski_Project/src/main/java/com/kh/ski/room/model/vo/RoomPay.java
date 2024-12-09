package com.kh.ski.room.model.vo;

public class RoomPay {
	
	private int roomReservNo;
	private int roomTotalPrice;
	private String checkInDate;
	private String checkOutDate;		
	private String reservDate;			// 예약일
	private String request;				// 요청사항
	private String roomPayCode;			// 결제코드
	private String roomPayToken;		// 결제토큰
	private String payStatus;        // 결제상태
	private String packRoomUsed;    // 패키지 상품으로 예약한 객실 여부
	private String rRefundStatus;  // 환불상태
	private String rRefundate;  // 환불날짜
	
	// 객식 조회 시 수용인원 필드 추가
	private int capacity;
	
	public RoomPay() {}

	public RoomPay(int roomReservNo, int roomTotalPrice, String checkInDate, String checkOutDate, String reservDate,
			String request, String roomPayCode, String roomPayToken, String payStatus, String packRoomUsed,
			String rRefundStatus, String rRefundate, int capacity) {
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
		this.capacity = capacity;
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

	public String getCheckInDate() {
		return checkInDate;
	}

	public void setCheckInDate(String checkInDate) {
		this.checkInDate = checkInDate;
	}

	public String getCheckOutDate() {
		return checkOutDate;
	}

	public void setCheckOutDate(String checkOutDate) {
		this.checkOutDate = checkOutDate;
	}

	public String getReservDate() {
		return reservDate;
	}

	public void setReservDate(String reservDate) {
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

	public String getrRefundate() {
		return rRefundate;
	}

	public void setrRefundate(String rRefundate) {
		this.rRefundate = rRefundate;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	@Override
	public String toString() {
		return "RoomPay [roomReservNo=" + roomReservNo + ", roomTotalPrice=" + roomTotalPrice + ", checkInDate="
				+ checkInDate + ", checkOutDate=" + checkOutDate + ", reservDate=" + reservDate + ", request=" + request
				+ ", roomPayCode=" + roomPayCode + ", roomPayToken=" + roomPayToken + ", payStatus=" + payStatus
				+ ", packRoomUsed=" + packRoomUsed + ", rRefundStatus=" + rRefundStatus + ", rRefundate=" + rRefundate
				+ ", capacity=" + capacity + "]";
	}

	
}
