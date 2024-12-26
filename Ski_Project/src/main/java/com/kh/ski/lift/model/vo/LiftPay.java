package com.kh.ski.lift.model.vo;

public class LiftPay {

	private int liftPurchaseNo;
	private String liftPurchaseDate;
	private String packLiftUsed;
	private int totalPrice;
	private int totalCount;
	private String tid;
	private String memberId;
	private String liftLrefundStatus;
	private String liftLrefundDate;
	private String QRCode;
	
	public LiftPay() {}

	public LiftPay(int liftPurchaseNo, String liftPurchaseDate, String packLiftUsed, int totalPrice, int totalCount,
			String tid, String memberId, String liftLrefundStatus, String liftLrefundDate, String qRCode) {
		super();
		this.liftPurchaseNo = liftPurchaseNo;
		this.liftPurchaseDate = liftPurchaseDate;
		this.packLiftUsed = packLiftUsed;
		this.totalPrice = totalPrice;
		this.totalCount = totalCount;
		this.tid = tid;
		this.memberId = memberId;
		this.liftLrefundStatus = liftLrefundStatus;
		this.liftLrefundDate = liftLrefundDate;
		QRCode = qRCode;
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

	public String getLiftLrefundDate() {
		return liftLrefundDate;
	}

	public void setLiftLrefundDate(String liftLrefundDate) {
		this.liftLrefundDate = liftLrefundDate;
	}

	public String getQRCode() {
		return QRCode;
	}

	public void setQRCode(String qRCode) {
		QRCode = qRCode;
	}

	@Override
	public String toString() {
		return "LiftPay [liftPurchaseNo=" + liftPurchaseNo + ", liftPurchaseDate=" + liftPurchaseDate
				+ ", packLiftUsed=" + packLiftUsed + ", totalPrice=" + totalPrice + ", totalCount=" + totalCount
				+ ", tid=" + tid + ", memberId=" + memberId + ", liftLrefundStatus=" + liftLrefundStatus
				+ ", liftLrefundDate=" + liftLrefundDate + ", QRCode=" + QRCode + "]";
	}



	
}
