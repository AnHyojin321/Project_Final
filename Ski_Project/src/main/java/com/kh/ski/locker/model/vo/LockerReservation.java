package com.kh.ski.locker.model.vo;

import java.util.Date;

public class LockerReservation {
    private int lockerReservNo;
    private String lockerStartDate;
    private String lockerEndDate;
    private int lockerTotalPrice;
    private String tid;
    private int memberNo;
    private int lockerNo;

    public LockerReservation() {}

	public LockerReservation(int lockerReservNo, String lockerStartDate, String lockerEndDate, int lockerTotalPrice,
			String tid, int memberNo, int lockerNo) {
		super();
		this.lockerReservNo = lockerReservNo;
		this.lockerStartDate = lockerStartDate;
		this.lockerEndDate = lockerEndDate;
		this.lockerTotalPrice = lockerTotalPrice;
		this.tid = tid;
		this.memberNo = memberNo;
		this.lockerNo = lockerNo;
	}

	public int getLockerReservNo() {
		return lockerReservNo;
	}

	public void setLockerReservNo(int lockerReservNo) {
		this.lockerReservNo = lockerReservNo;
	}

	public String getLockerStartDate() {
		return lockerStartDate;
	}

	public void setLockerStartDate(String lockerStartDate) {
		this.lockerStartDate = lockerStartDate;
	}

	public String getLockerEndDate() {
		return lockerEndDate;
	}

	public void setLockerEndDate(String lockerEndDate) {
		this.lockerEndDate = lockerEndDate;
	}

	public int getLockerTotalPrice() {
		return lockerTotalPrice;
	}

	public void setLockerTotalPrice(int lockerTotalPrice) {
		this.lockerTotalPrice = lockerTotalPrice;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getLockerNo() {
		return lockerNo;
	}

	public void setLockerNo(int lockerNo) {
		this.lockerNo = lockerNo;
	}

	@Override
	public String toString() {
		return "LockerReservation [lockerReservNo=" + lockerReservNo + ", lockerStartDate=" + lockerStartDate
				+ ", lockerEndDate=" + lockerEndDate + ", lockerTotalPrice=" + lockerTotalPrice + ", tid=" + tid
				+ ", memberNo=" + memberNo + ", lockerNo=" + lockerNo + "]";
	}
    
    
    
    
}
