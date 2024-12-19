package com.kh.ski.lift.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

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
	
	public LiftPay() {}

	public LiftPay(int liftPurchaseNo, String liftPurchaseDate, String liftPurchaseStatus, String packLiftUsed,
			String liftPayToken, String liftPayCode, int memberNo, String liftLrefundStatus) {
		super();
		this.liftPurchaseNo = liftPurchaseNo;
		this.liftPurchaseDate = liftPurchaseDate;
		this.liftPurchaseStatus = liftPurchaseStatus;
		this.packLiftUsed = packLiftUsed;
		this.liftPayToken = liftPayToken;
		this.liftPayCode = liftPayCode;
		this.memberNo = memberNo;
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

	public String getLiftPurchaseStatus() {
		return liftPurchaseStatus;
	}

	public void setLiftPurchaseStatus(String liftPurchaseStatus) {
		this.liftPurchaseStatus = liftPurchaseStatus;
	}

	public String getPackLiftUsed() {
		return packLiftUsed;
	}

	public void setPackLiftUsed(String packLiftUsed) {
		this.packLiftUsed = packLiftUsed;
	}

	public String getLiftPayToken() {
		return liftPayToken;
	}

	public void setLiftPayToken(String liftPayToken) {
		this.liftPayToken = liftPayToken;
	}

	public String getLiftPayCode() {
		return liftPayCode;
	}

	public void setLiftPayCode(String liftPayCode) {
		this.liftPayCode = liftPayCode;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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
				+ ", liftPurchaseStatus=" + liftPurchaseStatus + ", packLiftUsed=" + packLiftUsed + ", liftPayToken="
				+ liftPayToken + ", liftPayCode=" + liftPayCode + ", memberNo=" + memberNo + ", liftLrefundStatus="
				+ liftLrefundStatus + "]";
	}
	
	

}
