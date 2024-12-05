package com.kh.ski.room.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Room {
	
	private int roomNo;		 //	객실번호
	private String roomName; //	객실명
	private String roomDesc; //	객실설명
	private String roomType; //	객실타입
	private int capacity; 	 //	수용인원
	private int roomPrice;   //	객실가격

}
