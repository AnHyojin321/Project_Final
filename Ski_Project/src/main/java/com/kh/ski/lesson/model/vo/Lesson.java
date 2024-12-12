package com.kh.ski.lesson.model.vo;

import java.sql.Date;

public class Lesson {
	private int resNo;	//	RES_NO	NUMBER
	private Date lessonDate;	//	LESSON_DATE	DATE
	private String lessonTime;	//	LESSON_TIME	VARCHAR2(50 BYTE)
	private String lessonType;	//	LESSON_TYPE	VARCHAR2(30 BYTE)
	private String resStatus;	//	RES_STATUS	CHAR(1 BYTE)
	private String lessonTitle;	//	LESSON_TITLE	VARCHAR2(50 BYTE)
	private String lessonResCount;	//	LESSON_RES_COUNT	VARCHAR2(30 BYTE)
	private Date lessonResDate;	//	LESSON_RES_DATE	DATE
	private String lrRefundStatus;	//	LR_REFUND_STATUS	CHAR(1 BYTE)
	private Date lrRefundDate;	//	LR_REFUND_DATE	DATE

	public Lesson() {}

	public Lesson(int resNo, Date lessonDate, String lessonTime, String lessonType, String resStatus,
			String lessonTitle, String lessonResCount, Date lessonResDate, String lrRefundStatus, Date lrRefundDate) {
		super();
		this.resNo = resNo;
		this.lessonDate = lessonDate;
		this.lessonTime = lessonTime;
		this.lessonType = lessonType;
		this.resStatus = resStatus;
		this.lessonTitle = lessonTitle;
		this.lessonResCount = lessonResCount;
		this.lessonResDate = lessonResDate;
		this.lrRefundStatus = lrRefundStatus;
		this.lrRefundDate = lrRefundDate;
	}

	public int getResNo() {
		return resNo;
	}

	public void setResNo(int resNo) {
		this.resNo = resNo;
	}

	public Date getLessonDate() {
		return lessonDate;
	}

	public void setLessonDate(Date lessonDate) {
		this.lessonDate = lessonDate;
	}

	public String getLessonTime() {
		return lessonTime;
	}

	public void setLessonTime(String lessonTime) {
		this.lessonTime = lessonTime;
	}

	public String getLessonType() {
		return lessonType;
	}

	public void setLessonType(String lessonType) {
		this.lessonType = lessonType;
	}

	public String getResStatus() {
		return resStatus;
	}

	public void setResStatus(String resStatus) {
		this.resStatus = resStatus;
	}

	public String getLessonTitle() {
		return lessonTitle;
	}

	public void setLessonTitle(String lessonTitle) {
		this.lessonTitle = lessonTitle;
	}

	public String getLessonResCount() {
		return lessonResCount;
	}

	public void setLessonResCount(String lessonResCount) {
		this.lessonResCount = lessonResCount;
	}

	public Date getLessonResDate() {
		return lessonResDate;
	}

	public void setLessonResDate(Date lessonResDate) {
		this.lessonResDate = lessonResDate;
	}

	public String getLrRefundStatus() {
		return lrRefundStatus;
	}

	public void setLrRefundStatus(String lrRefundStatus) {
		this.lrRefundStatus = lrRefundStatus;
	}

	public Date getLrRefundDate() {
		return lrRefundDate;
	}

	public void setLrRefundDate(Date lrRefundDate) {
		this.lrRefundDate = lrRefundDate;
	}

	@Override
	public String toString() {
		return "Lesson [resNo=" + resNo + ", lessonDate=" + lessonDate + ", lessonTime=" + lessonTime + ", lessonType="
				+ lessonType + ", resStatus=" + resStatus + ", lessonTitle=" + lessonTitle + ", lessonResCount="
				+ lessonResCount + ", lessonResDate=" + lessonResDate + ", lrRefundStatus=" + lrRefundStatus
				+ ", lrRefundDate=" + lrRefundDate + "]";
	}

	

}

