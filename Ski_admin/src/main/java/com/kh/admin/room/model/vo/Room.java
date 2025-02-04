package com.kh.admin.room.model.vo;

public class Room {
	
	private int roomNo;
	private String roomName;
	private String roomDesc;
	private String roomType;
	private int capacity;
	private String status;  // 예약가능여부
	private int roomPrice;
	
	public Room() {}

	public Room(int roomNo, String roomName, String roomDesc, String roomType, int capacity, String status,
			int roomPrice) {
		super();
		this.roomNo = roomNo;
		this.roomName = roomName;
		this.roomDesc = roomDesc;
		this.roomType = roomType;
		this.capacity = capacity;
		this.status = status;
		this.roomPrice = roomPrice;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getRoomDesc() {
		return roomDesc;
	}

	public void setRoomDesc(String roomDesc) {
		this.roomDesc = roomDesc;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getRoomPrice() {
		return roomPrice;
	}

	public void setRoomPrice(int roomPrice) {
		this.roomPrice = roomPrice;
	}
	

	@Override
	public String toString() {
		return "Room [roomNo=" + roomNo + ", roomName=" + roomName + ", roomDesc=" + roomDesc + ", roomType=" + roomType
				+ ", capacity=" + capacity + ", status=" + status + ", roomPrice=" + roomPrice + "]";
	}

	

	

}
