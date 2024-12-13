package com.kh.ski.locker.model.vo;

public class Locker {
    private int lockerNo;     // 락커 번호
    private double lockerPrice; // 락커 가격

    // Getter 및 Setter
    public int getLockerNo() {
        return lockerNo;
    }

    public void setLockerNo(int lockerNo) {
        this.lockerNo = lockerNo;
    }

    public double getLockerPrice() {
        return lockerPrice;
    }

    public void setLockerPrice(double lockerPrice) {
        this.lockerPrice = lockerPrice;
    }
}
