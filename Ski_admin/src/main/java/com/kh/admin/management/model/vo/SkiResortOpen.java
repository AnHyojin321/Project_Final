package com.kh.admin.management.model.vo;

public class SkiResortOpen {
	private String skiResortIsOpen;
	private String skiResortDate;
	private String skiResortDay;
	
	public SkiResortOpen() {}

	public SkiResortOpen(String skiResortIsOpen, String skiResortDate, String skiResortDay) {
		super();
		this.skiResortIsOpen = skiResortIsOpen;
		this.skiResortDate = skiResortDate;
		this.skiResortDay = skiResortDay;
	}

	public String getSkiResortIsOpen() {
		return skiResortIsOpen;
	}

	public void setSkiResortIsOpen(String skiResortIsOpen) {
		this.skiResortIsOpen = skiResortIsOpen;
	}

	public String getSkiResortDate() {
		return skiResortDate;
	}

	public void setSkiResortDate(String skiResortDate) {
		this.skiResortDate = skiResortDate;
	}

	public String getSkiResortDay() {
		return skiResortDay;
	}

	public void setSkiResortDay(String skiResortDay) {
		this.skiResortDay = skiResortDay;
	}

	@Override
	public String toString() {
		return "SkiResortOpen [skiResortIsOpen=" + skiResortIsOpen + ", skiResortDate=" + skiResortDate
				+ ", skiResortDay=" + skiResortDay + "]";
	}

	
}
