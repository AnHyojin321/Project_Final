package com.kh.ski.lift.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class LiftOrder {
	
	// 리프트권 주문 테이블
	private int liftOrderNo;
	private int liftCount;
	private int liftTotalPrice;
	private int liftNo;
	private int liftPurchaseNo;
}
