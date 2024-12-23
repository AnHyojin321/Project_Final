package com.kh.admin.management.model.vo;

public class SkiResortOpen {
	private int skiResortOpenNo;
	private String skiResortIsOpen;
	
	public SkiResortOpen() {}

	public SkiResortOpen(int skiResortOpenNo, String skiResortIsOpen) {
		super();
		this.skiResortOpenNo = skiResortOpenNo;
		this.skiResortIsOpen = skiResortIsOpen;
	}

	public int getSkiResortOpenNo() {
		return skiResortOpenNo;
	}

	public void setSkiResortOpenNo(int skiResortOpenNo) {
		this.skiResortOpenNo = skiResortOpenNo;
	}

	public String getSkiResortIsOpen() {
		return skiResortIsOpen;
	}

	public void setSkiResortIsOpen(String skiResortIsOpen) {
		this.skiResortIsOpen = skiResortIsOpen;
	}

	@Override
	public String toString() {
		return "SkiResortOpen [skiResortOpenNo=" + skiResortOpenNo + ", skiResortIsOpen=" + skiResortIsOpen + "]";
	}

	
	
}
