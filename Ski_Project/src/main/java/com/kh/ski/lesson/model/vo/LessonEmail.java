package com.kh.ski.lesson.model.vo;

import java.sql.Date;

public class LessonEmail {
	
	// 강습 예약 이메일 테이블
 	private int leEmailNo; //	LE_EMAIL_NO	NUMBER
	private Date sendDate; //	SEND_DATE	DATE

	public LessonEmail() {}

	public LessonEmail(int leEmailNo, Date sendDate) {
		super();
		this.leEmailNo = leEmailNo;
		this.sendDate = sendDate;
	}

	public int getLeEmailNo() {
		return leEmailNo;
	}

	public void setLeEmailNo(int leEmailNo) {
		this.leEmailNo = leEmailNo;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	@Override
	public String toString() {
		return "LessonEmail [leEmailNo=" + leEmailNo + ", sendDate=" + sendDate + "]";
	}
	
	
}
