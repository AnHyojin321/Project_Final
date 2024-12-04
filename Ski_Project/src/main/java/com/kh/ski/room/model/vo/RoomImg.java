package com.kh.ski.room.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class RoomImg {
	
	private int roomImgNo;			 // 이미지 번호
	private String roomOriginName; 	 // 원본파일명
	private String roomChangeName;   // 수정파일명 
	private String roomImgPath; 	 // 파일경로
	private String roomThumbnail;  	 // 썸네일여부


}
