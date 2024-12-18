package com.kh.ski.pack.model.vo;

public class PackagePay {
	
	private int packageReservNo;	//	PACKAGE_RESERV_NO		
	private String tid;		//	PACKAGE_TID	
	private String prefundStatus;	//	PREFUND_STATUS
	private String prefuncDate;		//	PREFUND_DATE	
	private int memberNo;			//	MEMBER_NO
	private int packageNo;			//	PACKAGE_NO
	
	public PackagePay() {}

	public PackagePay(int packageReservNo, String tid, String prefundStatus, String prefuncDate, int memberNo,
			int packageNo) {
		super();
		this.packageReservNo = packageReservNo;
		this.tid = tid;
		this.prefundStatus = prefundStatus;
		this.prefuncDate = prefuncDate;
		this.memberNo = memberNo;
		this.packageNo = packageNo;
	}

	public int getPackageReservNo() {
		return packageReservNo;
	}

	public void setPackageReservNo(int packageReservNo) {
		this.packageReservNo = packageReservNo;
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

	@Override
	public String toString() {
		return "PackagePay [packageReservNo=" + packageReservNo + ", tid=" + tid + ", prefundStatus=" + prefundStatus
				+ ", prefuncDate=" + prefuncDate + ", memberNo=" + memberNo + ", packageNo=" + packageNo + "]";
	}


	
	

}
