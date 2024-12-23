package com.kh.ski.lift.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

public class LiftPay {
	
	// 리프트권 구매 테이블
	private int liftPurchaseNo;
	private String liftPurchaseDate;
	private String packLiftUsed;
	private int totalPrice;
	private int totalCount;
	private String tid;
	private String memberId;
	private String liftLrefundStatus;
	
	public LiftPay() {}

	public LiftPay(int liftPurchaseNo, String liftPurchaseDate, String packLiftUsed, int totalPrice, int totalCount,
			String tid, String memberId, String liftLrefundStatus) {
		super();
		this.liftPurchaseNo = liftPurchaseNo;
		this.liftPurchaseDate = liftPurchaseDate;
		this.packLiftUsed = packLiftUsed;
		this.totalPrice = totalPrice;
		this.totalCount = totalCount;
		this.tid = tid;
		this.memberId = memberId;
		this.liftLrefundStatus = liftLrefundStatus;

	}

	public int getLiftPurchaseNo() {
		return liftPurchaseNo;
	}

	public void setLiftPurchaseNo(int liftPurchaseNo) {
		this.liftPurchaseNo = liftPurchaseNo;
	}

	public String getLiftPurchaseDate() {
		return liftPurchaseDate;
	}

	public void setLiftPurchaseDate(String liftPurchaseDate) {
		this.liftPurchaseDate = liftPurchaseDate;
	}

	public String getPackLiftUsed() {
		return packLiftUsed;
	}

	public void setPackLiftUsed(String packLiftUsed) {
		this.packLiftUsed = packLiftUsed;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getLiftLrefundStatus() {
		return liftLrefundStatus;
	}

	public void setLiftLrefundStatus(String liftLrefundStatus) {
		this.liftLrefundStatus = liftLrefundStatus;
	}



	@Override
	public String toString() {
		return "LiftPay [liftPurchaseNo=" + liftPurchaseNo + ", liftPurchaseDate=" + liftPurchaseDate
				+ ", packLiftUsed=" + packLiftUsed + ", totalPrice=" + totalPrice + ", totalCount=" + totalCount
				+ ", tid=" + tid + ", memberId=" + memberId + ", liftLrefundStatus=" + liftLrefundStatus  + "]";
	}

	
	

}
