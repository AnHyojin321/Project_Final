package com.kh.ski.locker.model.vo;

import java.util.Date;

public class LockerReservation {
    private int lockerReservNo;
    private Date lockerStartDate;
    private Date lockerEndDate;
    private int lockerTotalPrice;
    private String lockerPayCode;
    private String lockerPayToken;
    private int memberNo;
    private int lockerNo;

    // Getters and Setters
    public int getLockerReservNo() { return lockerReservNo; }
    public void setLockerReservNo(int lockerReservNo) { this.lockerReservNo = lockerReservNo; }

    public Date getLockerStartDate() { return lockerStartDate; }
    public void setLockerStartDate(Date lockerStartDate) { this.lockerStartDate = lockerStartDate; }

    public Date getLockerEndDate() { return lockerEndDate; }
    public void setLockerEndDate(Date lockerEndDate) { this.lockerEndDate = lockerEndDate; }

    public int getLockerTotalPrice() { return lockerTotalPrice; }
    public void setLockerTotalPrice(int lockerTotalPrice) { this.lockerTotalPrice = lockerTotalPrice; }

    public String getLockerPayCode() { return lockerPayCode; }
    public void setLockerPayCode(String lockerPayCode) { this.lockerPayCode = lockerPayCode; }

    public String getLockerPayToken() { return lockerPayToken; }
    public void setLockerPayToken(String lockerPayToken) { this.lockerPayToken = lockerPayToken; }

    public int getMemberNo() { return memberNo; }
    public void setMemberNo(int memberNo) { this.memberNo = memberNo; }

    public int getLockerNo() { return lockerNo; }
    public void setLockerNo(int lockerNo) { this.lockerNo = lockerNo; }
}
