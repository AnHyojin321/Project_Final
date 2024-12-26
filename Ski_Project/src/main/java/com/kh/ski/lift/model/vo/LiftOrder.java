package com.kh.ski.lift.model.vo;


public class LiftOrder {
	
	// 리프트권 주문 테이블
	private int liftOrderNo;
	private int liftCount;
	private int liftTotalPrice;
	private int liftNo;
	private String memberId;
    private String liftType; // 김동준 추가
    private String liftAge;
	private String liftPurchaseDate; // 김동준 추가 
	
	public LiftOrder() {}

	public LiftOrder(int liftOrderNo, int liftCount, int liftTotalPrice, int liftNo, String memberId) {
		super();
		this.liftOrderNo = liftOrderNo;
		this.liftCount = liftCount;
		this.liftTotalPrice = liftTotalPrice;
		this.liftNo = liftNo;
		this.memberId = memberId;
	}

	public int getLiftOrderNo() {
		return liftOrderNo;
	}

	public void setLiftOrderNo(int liftOrderNo) {
		this.liftOrderNo = liftOrderNo;
	}

	public int getLiftCount() {
		return liftCount;
	}

	public void setLiftCount(int liftCount) {
		this.liftCount = liftCount;
	}

	public int getLiftTotalPrice() {
		return liftTotalPrice;
	}

	public void setLiftTotalPrice(int liftTotalPrice) {
		this.liftTotalPrice = liftTotalPrice;
	}

	public int getLiftNo() {
		return liftNo;
	}

	public void setLiftNo(int liftNo) {
		this.liftNo = liftNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getLiftType() {
		return liftType;
	}

	public void setLiftType(String liftType) {
		this.liftType = liftType;
	}

	public String getLiftAge() {
		return liftAge;
	}

	public void setLiftAge(String liftAge) {
		this.liftAge = liftAge;
	}

	public String getLiftPurchaseDate() {
		return liftPurchaseDate;
	}

	public void setLiftPurchaseDate(String liftPurchaseDate) {
		this.liftPurchaseDate = liftPurchaseDate;
	}

	@Override
	public String toString() {
		return "LiftOrder [liftOrderNo=" + liftOrderNo + ", liftCount=" + liftCount + ", liftTotalPrice="
				+ liftTotalPrice + ", liftNo=" + liftNo + ", memberId=" + memberId + "]";
	}


	
	
}
