package com.kh.admin.lift.model.vo;

public class LiftOrder {

	private int liftOrderNo;
	private int liftCount;
	private int liftTotalPrice;
	private int liftNo;
	private int liftPurchaseNo;
	
	public LiftOrder(){}

	public LiftOrder(int liftOrderNo, int liftCount, int liftTotalPrice, int liftNo, int liftPurchaseNo) {
		super();
		this.liftOrderNo = liftOrderNo;
		this.liftCount = liftCount;
		this.liftTotalPrice = liftTotalPrice;
		this.liftNo = liftNo;
		this.liftPurchaseNo = liftPurchaseNo;
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

	public int getLiftPurchaseNo() {
		return liftPurchaseNo;
	}

	public void setLiftPurchaseNo(int liftPurchaseNo) {
		this.liftPurchaseNo = liftPurchaseNo;
	}

	@Override
	public String toString() {
		return "LiftOrder [liftOrderNo=" + liftOrderNo + ", liftCount=" + liftCount + ", liftTotalPrice="
				+ liftTotalPrice + ", liftNo=" + liftNo + ", liftPurchaseNo=" + liftPurchaseNo + "]";
	}
	
	
}
