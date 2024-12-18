package com.kh.ski.room.model.vo;

public class RoomPay {
	
	private int roomReservNo;
	private int totalPrice;
	private String checkInDate;
	private String checkOutDate;		
	private String reservDate;			// 예약일
	private String request;				// 요청사항
	private String tid;		// 결제토큰
	private String payStatus;        // 결제상태
	private String packRoomUsed;    // 패키지 상품으로 예약한 객실 여부
	private String rRefundStatus;  // 환불상태
	private String rRefundate;  // 환불날짜
	
	// 객식 조회 시 수용인원 필드 추가
	private int roomNo;
	private int memberNo;
	private String roomType;
	
	public RoomPay() {}

	public RoomPay(int roomReservNo, int totalPrice, String checkInDate, String checkOutDate, String reservDate,
			String request, String tid, String payStatus, String packRoomUsed, String rRefundStatus, String rRefundate,
			int roomNo, int memberNo) {
		super();
		this.roomReservNo = roomReservNo;
		this.totalPrice = totalPrice;
		this.checkInDate = checkInDate;
		this.checkOutDate = checkOutDate;
		this.reservDate = reservDate;
		this.request = request;
		this.tid = tid;
		this.payStatus = payStatus;
		this.packRoomUsed = packRoomUsed;
		this.rRefundStatus = rRefundStatus;
		this.rRefundate = rRefundate;
		this.roomNo = roomNo;
		this.memberNo = memberNo;
	}
	

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public int getRoomReservNo() {
		return roomReservNo;
	}

	public void setRoomReservNo(int roomReservNo) {
		this.roomReservNo = roomReservNo;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
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

	public String getrRefundate() {
		return rRefundate;
	}

	public void setrRefundate(String rRefundate) {
		this.rRefundate = rRefundate;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "RoomPay [roomReservNo=" + roomReservNo + ", totalPrice=" + totalPrice + ", checkInDate=" + checkInDate
				+ ", checkOutDate=" + checkOutDate + ", reservDate=" + reservDate + ", request=" + request + ", tid="
				+ tid + ", payStatus=" + payStatus + ", packRoomUsed=" + packRoomUsed + ", rRefundStatus="
				+ rRefundStatus + ", rRefundate=" + rRefundate + ", roomNo=" + roomNo + ", memberNo=" + memberNo
				+ ", roomType=" + roomType + "]";
	}

	
	
	

	
}
