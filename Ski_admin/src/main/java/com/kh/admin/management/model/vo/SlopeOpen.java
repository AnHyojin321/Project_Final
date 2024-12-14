package com.kh.admin.management.model.vo;

public class SlopeOpen {
	
	private int slopeNo;
	private String slopeName;
	private String slopeLevel;
	private String slopeIsOpen;
	private String slopeNote;
	
	public SlopeOpen() {}
	
	

	public SlopeOpen(int slopeNo, String slopeName, String slopeLevel, String slopeIsOpen, String slopeNote) {
		super();
		this.slopeNo = slopeNo;
		this.slopeName = slopeName;
		this.slopeLevel = slopeLevel;
		this.slopeIsOpen = slopeIsOpen;
		this.slopeNote = slopeNote;
	}



	public int getSlopeNo() {
		return slopeNo;
	}

	public void setSlopeNo(int slopeNo) {
		this.slopeNo = slopeNo;
	}

	public String getSlopeName() {
		return slopeName;
	}

	public void setSlopeName(String slopeName) {
		this.slopeName = slopeName;
	}

	public String getSlopeLevel() {
		return slopeLevel;
	}

	public void setSlopeLevel(String slopeLevel) {
		this.slopeLevel = slopeLevel;
	}

	public String getSlopeIsOpen() {
		return slopeIsOpen;
	}

	public void setSlopeIsOpen(String slopeIsOpen) {
		this.slopeIsOpen = slopeIsOpen;
	}

	public String getSlopeNote() {
		return slopeNote;
	}

	public void setSlopeNote(String slopeNote) {
		this.slopeNote = slopeNote;
	}



	@Override
	public String toString() {
		return "SlopeOpen [slopeNo=" + slopeNo + ", slopeName=" + slopeName + ", slopeLevel=" + slopeLevel
				+ ", slopeIsOpen=" + slopeIsOpen + ", slopeNote=" + slopeNote + "]";
	}
	
	
}
