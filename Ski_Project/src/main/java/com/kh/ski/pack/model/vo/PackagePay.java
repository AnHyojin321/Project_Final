package com.kh.ski.pack.model.vo;

import java.sql.Date;

public class PackagePay {
	
	private int packageReservNo;	//	PACKAGE_RESERV_NO
	private String checkInDate;
	private String checkOutDate;
	private String tid;		//	PACKAGE_TID	
	private String prefundStatus;	//	PREFUND_STATUS
	private String prefuncDate;		//	PREFUND_DATE	
	private int memberNo;			//	MEMBER_NO
	private int packageNo;			//	PACKAGE_NO
	
	private String packageName; 
	private String productComposit;
	private String availableStartDate;
	private String availableEndDate;
	private int packagePrice;
	private String payDate;
	
	public PackagePay() {}

	public PackagePay(int packageReservNo, String checkInDate, String checkOutDate, String tid, String prefundStatus,
			String prefuncDate, int memberNo, int packageNo, String packageName, int packagePrice, String payDate) {
		super();
		this.packageReservNo = packageReservNo;
		this.checkInDate = checkInDate;
		this.checkOutDate = checkOutDate;
		this.tid = tid;
		this.prefundStatus = prefundStatus;
		this.prefuncDate = prefuncDate;
		this.memberNo = memberNo;
		this.packageNo = packageNo;
		this.packageName = packageName;
		this.packagePrice = packagePrice;
		this.payDate = payDate;
	}
	
	

	public String getProductComposit() {
		return productComposit;
	}

	public void setProductComposit(String productComposit) {
		this.productComposit = productComposit;
	}

	public String getAvailableStartDate() {
		return availableStartDate;
	}

	public void setAvailableStartDate(String availableStartDate) {
		this.availableStartDate = availableStartDate;
	}

	

	public String getAvailableEndDate() {
		return availableEndDate;
	}

	public void setAvailableEndDate(String availableEndDate) {
		this.availableEndDate = availableEndDate;
	}

	public int getPackageReservNo() {
		return packageReservNo;
	}

	public void setPackageReservNo(int packageReservNo) {
		this.packageReservNo = packageReservNo;
	}

	public String getCheckInDate() {
		return checkInDate;
	}

	public void setCheckInDate(String checkInDate) {
		this.checkInDate = checkInDate;
	}

	public String getCheckOutDate() {
		return checkOutDate;
	}

	public void setCheckOutDate(String checkOutDate) {
		this.checkOutDate = checkOutDate;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getPrefundStatus() {
		return prefundStatus;
	}

	public void setPrefundStatus(String prefundStatus) {
		this.prefundStatus = prefundStatus;
	}

	public String getPrefuncDate() {
		return prefuncDate;
	}

	public void setPrefuncDate(String prefuncDate) {
		this.prefuncDate = prefuncDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getPackageNo() {
		return packageNo;
	}

	public void setPackageNo(int packageNo) {
		this.packageNo = packageNo;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public int getPackagePrice() {
		return packagePrice;
	}

	public void setPackagePrice(int packagePrice) {
		this.packagePrice = packagePrice;
	}

	public String getPayDate() {
		return payDate;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}

	@Override
	public String toString() {
		return "PackagePay [packageReservNo=" + packageReservNo + ", checkInDate=" + checkInDate + ", checkOutDate="
				+ checkOutDate + ", tid=" + tid + ", prefundStatus=" + prefundStatus + ", prefuncDate=" + prefuncDate
				+ ", memberNo=" + memberNo + ", packageNo=" + packageNo + ", packageName=" + packageName
				+ ", productComposit=" + productComposit + ", availableStartDate=" + availableStartDate
				+ ", availableEndDate=" + availableEndDate + ", packagePrice=" + packagePrice + ", payDate=" + payDate
				+ "]";
	}

	
	


	

	
	
	

}
