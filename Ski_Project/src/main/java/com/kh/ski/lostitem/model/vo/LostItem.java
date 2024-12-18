package com.kh.ski.lostitem.model.vo;

import java.util.Date;

public class LostItem {

    private int lostNo; // 분실물 번호
    private String lostTitle; // 분실물 제목
    private String lostLocation; // 분실 장소
    private String lostContent; // 분실물 내용
    private int count; // 조회수
    private Date createDate; // 작성일
    private char lostItemStatus; // 분실물 처리 여부
    private char lostStatus; // 삭제 여부

    // Getter and Setter for lostNo
    public int getLostNo() {
        return lostNo;
    }

    public void setLostNo(int lostNo) {
        this.lostNo = lostNo;
    }

    // Getter and Setter for lostTitle
    public String getLostTitle() {
        return lostTitle;
    }

    public void setLostTitle(String lostTitle) {
        this.lostTitle = lostTitle;
    }

    // Getter and Setter for lostLocation
    public String getLostLocation() {
        return lostLocation;
    }

    public void setLostLocation(String lostLocation) {
        this.lostLocation = lostLocation;
    }

    // Getter and Setter for lostContent
    public String getLostContent() {
        return lostContent;
    }

    public void setLostContent(String lostContent) {
        this.lostContent = lostContent;
    }

    // Getter and Setter for count
    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    // Getter and Setter for createDate
    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    // Getter and Setter for lostItemStatus
    public char getLostItemStatus() {
        return lostItemStatus;
    }

    public void setLostItemStatus(char lostItemStatus) {
        this.lostItemStatus = lostItemStatus;
    }

    // Getter and Setter for lostStatus
    public char getLostStatus() {
        return lostStatus;
    }

    public void setLostStatus(char lostStatus) {
        this.lostStatus = lostStatus;
    }
}
