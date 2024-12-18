package com.kh.ski.locker.model.vo;

public class Locker {
    private int lockerNo;    // LOCKER_NO
    private int lockerPrice; // LOCKER_PRICE

    // Getters & Setters
    public int getLockerNo() {
        return lockerNo;
    }

    public void setLockerNo(int lockerNo) {
        this.lockerNo = lockerNo;
    }

    public int getLockerPrice() {
        return lockerPrice;
    }

    public void setLockerPrice(int lockerPrice) {
        this.lockerPrice = lockerPrice;
    }

    @Override
    public String toString() {
        return "Locker [lockerNo=" + lockerNo + ", lockerPrice=" + lockerPrice + "]";
    }
}
