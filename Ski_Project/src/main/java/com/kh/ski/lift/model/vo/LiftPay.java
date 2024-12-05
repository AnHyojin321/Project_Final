package com.kh.ski.lift.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class LiftPay {
	
	// 리프트권 구매 테이블
	private int liftPurchaseNo;
	private String liftPurchaseDate;
	private String liftPurchaseStatus;
	private String packLiftUsed;
	private String liftPayToken;
	private String liftPayCode;
	private int memberNo;
	private String liftLrefundStatus;

}
