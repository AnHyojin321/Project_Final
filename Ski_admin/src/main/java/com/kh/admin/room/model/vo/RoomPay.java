package com.kh.admin.room.model.vo;

public class RoomPay {
	
	private int roomReservNo;
	private int roomTotalPrice;
	private String checkInDate;
	private String checkOutDate;		
	private String reservDate;			// 예약일
	private String request;				// 요청사항
	private String tid;
	private String payStatus;        // 결제상태
	private String packRoomUsed;    // 패키지 상품으로 예약한 객실 여부
	private String rRefundStatus;  // 환불상태
	private String rRefundDate;  // 환불날짜
	private int memberNo;		// 회원번호
	private int roomNo;			// 객실번호
	private int amount;
	
	// 객식 조회 시 수용인원 필드 추가
	private int capacity;
	
	public RoomPay() {}

	public RoomPay(int roomReservNo, int roomTotalPrice, String checkInDate, String checkOutDate, String reservDate,
			String request, String tid, String payStatus, String packRoomUsed, String rRefundStatus, String rRefundDate,
			int memberNo, int roomNo, int amount, int capacity) {
		super();
		this.roomReservNo = roomReservNo;
		this.roomTotalPrice = roomTotalPrice;
		this.checkInDate = checkInDate;
		this.checkOutDate = checkOutDate;
		this.reservDate = reservDate;
		this.request = request;
		this.tid = tid;
		this.payStatus = payStatus;
		this.packRoomUsed = packRoomUsed;
		this.rRefundStatus = rRefundStatus;
		this.rRefundDate = rRefundDate;
		this.memberNo = memberNo;
		this.roomNo = roomNo;
		this.amount = amount;
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

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
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

	public String getrRefundDate() {
		return rRefundDate;
	}

	public void setrRefundDate(String rRefundDate) {
		this.rRefundDate = rRefundDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
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
				+ ", tid=" + tid + ", payStatus=" + payStatus + ", packRoomUsed=" + packRoomUsed + ", rRefundStatus="
				+ rRefundStatus + ", rRefundate=" + rRefundDate + ", memberNo=" + memberNo + ", roomNo=" + roomNo
				+ ", amount=" + amount + ", capacity=" + capacity + "]";
	}

	
	
}
