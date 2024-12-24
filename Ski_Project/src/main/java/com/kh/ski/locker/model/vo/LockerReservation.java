package com.kh.ski.locker.model.vo;

public class LockerReservation {
    private int lockerReservNo;
    private String lockerStartDate;
    private String lockerEndDate;
    private int lockerTotalPrice;
    private String tid;
    private int memberNo;
    private int lockerNo;
    private String lrefundStatus; // 환불 상태
    private String packLockerUsed; // 사용 여부 (Y/N)
    private String lrefundDate; // 환불 처리일 추가

    public LockerReservation() {}


    public LockerReservation(int lockerReservNo, String lockerStartDate, String lockerEndDate, int lockerTotalPrice,
                             String tid, int memberNo, int lockerNo, String lrefundStatus, String packLockerUsed,
                             String lrefundDate) {
        this.lockerReservNo = lockerReservNo;
        this.lockerStartDate = lockerStartDate;
        this.lockerEndDate = lockerEndDate;
        this.lockerTotalPrice = lockerTotalPrice;
        this.tid = tid;
        this.memberNo = memberNo;
        this.lockerNo = lockerNo;
        this.lrefundStatus = lrefundStatus;
        this.packLockerUsed = packLockerUsed;
        this.lrefundDate = lrefundDate; // 추가된 필드 초기화
    }

    // Getter와 Setter
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

    public String getLrefundStatus() {
        return lrefundStatus;
    }

    public void setLrefundStatus(String lrefundStatus) {
        this.lrefundStatus = lrefundStatus;
    }

    public String getPackLockerUsed() { // 추가된 Getter
        return packLockerUsed;
    }

    public void setPackLockerUsed(String packLockerUsed) { // 추가된 Setter
        this.packLockerUsed = packLockerUsed;
    }
    
    public String getLrefundDate() { // 추가된 Getter
        return lrefundDate;
    }

    public void setLrefundDate(String lrefundDate) { // 추가된 Setter
        this.lrefundDate = lrefundDate;
    }

    @Override
    public String toString() {
        return "LockerReservation [lockerReservNo=" + lockerReservNo + ", lockerStartDate=" + lockerStartDate
                + ", lockerEndDate=" + lockerEndDate + ", lockerTotalPrice=" + lockerTotalPrice + ", tid=" + tid
                + ", memberNo=" + memberNo + ", lockerNo=" + lockerNo + ", lrefundStatus=" + lrefundStatus
                + ", packLockerUsed=" + packLockerUsed + ", lrefundDate=" + lrefundDate + "]";
    }
}
