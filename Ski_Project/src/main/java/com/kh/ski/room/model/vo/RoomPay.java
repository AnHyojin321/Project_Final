package com.kh.ski.room.model.vo;

public class RoomPay {
	
	private int roomReservNo;
	private int amount;
	private String checkInDate;
	private String checkOutDate;		
	private String reservDate;			// 예약일
	private String request;				// 요청사항
	private String tid;		// 결제토큰
	private String payStatus;        // 결제상태
	private String packRoomUsed;    // 패키지 상품으로 예약한 객실 여부
	private String rRefundStatus;  // 환불상태
	private String rRefundate;  // 환불날짜
	
	private int packageNo;
	
	// 객식 조회 시 수용인원 필드 추가
	private int roomNo;
	private int memberNo;
	private String roomType;
	private String roomName;
	private int roomPrice;
	
	public RoomPay() {}

	public RoomPay(int roomReservNo, int amount, String checkInDate, String checkOutDate, String reservDate,
			String request, String tid, String payStatus, String packRoomUsed, String rRefundStatus, String rRefundate,
			int packageNo, int roomNo, int memberNo, String roomType, String roomName, int roomPrice) {
		super();
		this.roomReservNo = roomReservNo;
		this.amount = amount;
		this.checkInDate = checkInDate;
		this.checkOutDate = checkOutDate;
		this.reservDate = reservDate;
		this.request = request;
		this.tid = tid;
		this.payStatus = payStatus;
		this.packRoomUsed = packRoomUsed;
		this.rRefundStatus = rRefundStatus;
		this.rRefundate = rRefundate;
		this.packageNo = packageNo;
		this.roomNo = roomNo;
		this.memberNo = memberNo;
		this.roomType = roomType;
		this.roomName = roomName;
		this.roomPrice = roomPrice;
	}

	public int getRoomReservNo() {
		return roomReservNo;
	}

	public void setRoomReservNo(int roomReservNo) {
		this.roomReservNo = roomReservNo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
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

	public int getPackageNo() {
		return packageNo;
	}

	public void setPackageNo(int packageNo) {
		this.packageNo = packageNo;
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

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public int getRoomPrice() {
		return roomPrice;
	}

	public void setRoomPrice(int roomPrice) {
		this.roomPrice = roomPrice;
	}

	@Override
	public String toString() {
		return "RoomPay [roomReservNo=" + roomReservNo + ", amount=" + amount + ", checkInDate=" + checkInDate
				+ ", checkOutDate=" + checkOutDate + ", reservDate=" + reservDate + ", request=" + request + ", tid="
				+ tid + ", payStatus=" + payStatus + ", packRoomUsed=" + packRoomUsed + ", rRefundStatus="
				+ rRefundStatus + ", rRefundate=" + rRefundate + ", packageNo=" + packageNo + ", roomNo=" + roomNo
				+ ", memberNo=" + memberNo + ", roomType=" + roomType + ", roomName=" + roomName + ", roomPrice="
				+ roomPrice + "]";
	}

	
	
}
