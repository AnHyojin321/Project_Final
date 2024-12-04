package com.kh.ski.room.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class RoomPay {
	
	private int roomReservNo;		//	객실 예약 번호	ROOM_RESERV_NO
	private int roomTotalPrice;		//	전체가격	ROOM_TOTAL_PRICE
	private Date checkInDate;		//	입실날짜	CHECK_IN_DATE
	private Date checkOutDate;		//	퇴실날짜	CHECK_OUT_DATE
	private Date reservDate;		//	예약일	RESERV_DATE
	private String request;	 		//	요청사항	REQUEST
	private String roomPayCode;		//	객실 결제 코드	ROOM_PAY_CODE
	private String roomPayToken;	//	객실 결제 토큰	ROOM_PAY_TOKEN
	private String payStatus; 		//	객실 결제 상태	PAY_STATUS
	private String packRoomUsed;	//	패키지 선불권 사용 여부	PACK_ROOM_USED
	private String rRefundStatus;	//	환불 상태	RREFUND_SATUS
	private Date rRefundDate; 		//	환불일	RREFUND_DATE

}
