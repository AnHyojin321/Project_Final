package com.kh.ski.management.model.vo;

public class SkiResortOpen {
	private String skiResortIsOpen;
	private String skiResortDay;
	
	public SkiResortOpen() {}

	public SkiResortOpen(String skiResortIsOpen, String skiResortDay) {
		super();
		this.skiResortIsOpen = skiResortIsOpen;
		this.skiResortDay = skiResortDay;
	}

	public String getSkiResortIsOpen() {
		return skiResortIsOpen;
	}

	public void setSkiResortIsOpen(String skiResortIsOpen) {
		this.skiResortIsOpen = skiResortIsOpen;
	}

	public String getSkiResortDay() {
		return skiResortDay;
	}

	public void setSkiResortDay(String skiResortDay) {
		this.skiResortDay = skiResortDay;
	}

	@Override
	public String toString() {
		return "SkiResortOpen [skiResortIsOpen=" + skiResortIsOpen + ", skiResortDay=" + skiResortDay + "]";
	}


	
	
}
