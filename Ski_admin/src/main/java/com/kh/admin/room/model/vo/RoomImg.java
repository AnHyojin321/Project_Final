package com.kh.admin.room.model.vo;

public class RoomImg {
	
	private int roomImgNo;
	private String roomOriginName;
	private String roomChangeName;
	private String roomImgPath;
	private String roomThumbnail;
	
	private int roomNo;  // roomNo 필드 추가
	
	public RoomImg() {}

	

	public RoomImg(int roomImgNo, String roomOriginName, String roomChangeName, String roomImgPath,
			String roomThumbnail, int roomNo) {
		super();
		this.roomImgNo = roomImgNo;
		this.roomOriginName = roomOriginName;
		this.roomChangeName = roomChangeName;
		this.roomImgPath = roomImgPath;
		this.roomThumbnail = roomThumbnail;
		this.roomNo = roomNo;
	}



	public int getRoomImgNo() {
		return roomImgNo;
	}

	public void setRoomImgNo(int roomImgNo) {
		this.roomImgNo = roomImgNo;
	}

	public String getRoomOriginName() {
		return roomOriginName;
	}

	public void setRoomOriginName(String roomOriginName) {
		this.roomOriginName = roomOriginName;
	}

	public String getRoomChangeName() {
		return roomChangeName;
	}

	public void setRoomChangeName(String roomChangeName) {
		this.roomChangeName = roomChangeName;
	}

	public String getRoomImgPath() {
		return roomImgPath;
	}

	public void setRoomImgPath(String roomImgPath) {
		this.roomImgPath = roomImgPath;
	}

	public String getRoomThumbnail() {
		return roomThumbnail;
	}

	public void setRoomThumbnail(String roomThumbnail) {
		this.roomThumbnail = roomThumbnail;
	}
	
	

	public int getRoomNo() {
		return roomNo;
	}



	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}



	@Override
	public String toString() {
		return "RoomImg [roomImgNo=" + roomImgNo + ", roomOriginName=" + roomOriginName + ", roomChangeName="
				+ roomChangeName + ", roomImgPath=" + roomImgPath + ", roomThumbnail=" + roomThumbnail + ", roomNo="
				+ roomNo + "]";
	}



	
	
	
	

}
