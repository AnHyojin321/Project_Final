package com.kh.ski.notice.model.vo;
import java.util.Date;

public class Notice {
    private int noticeNo;        // 공지사항 번호
    private String noticeTitle;  // 공지사항 제목
    private String noticeContent; // 공지사항 내용
    private Date createDate;     // 작성일
    private char noticeStatus;   // 삭제 여부

    // Getters and Setters
    public int getNoticeNo() {
        return noticeNo;
    }

    public void setNoticeNo(int noticeNo) {
        this.noticeNo = noticeNo;
    }

    public String getNoticeTitle() {
        return noticeTitle;
    }

    public void setNoticeTitle(String noticeTitle) {
        this.noticeTitle = noticeTitle;
    }

    public String getNoticeContent() {
        return noticeContent;
    }

    public void setNoticeContent(String noticeContent) {
        this.noticeContent = noticeContent;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public char getNoticeStatus() {
        return noticeStatus;
    }

    public void setNoticeStatus(char noticeStatus) {
        this.noticeStatus = noticeStatus;
    }
}
