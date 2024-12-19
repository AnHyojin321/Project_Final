package com.kh.admin.lift.model.vo;

public class Lift {
	private int liftNo;
	private String liftType;
	private int liftPrice;
	private String liftAge;
	
	public Lift() {}

	public Lift(int liftNo, String liftType, int liftPrice, String liftAge) {
		super();
		this.liftNo = liftNo;
		this.liftType = liftType;
		this.liftPrice = liftPrice;
		this.liftAge = liftAge;
	}

	public int getLiftNo() {
		return liftNo;
	}

	public void setLiftNo(int liftNo) {
		this.liftNo = liftNo;
	}

	public String getLiftType() {
		return liftType;
	}

	public void setLiftType(String liftType) {
		this.liftType = liftType;
	}

	public int getLiftPrice() {
		return liftPrice;
	}

	public void setLiftPrice(int liftPrice) {
		this.liftPrice = liftPrice;
	}

	public String getLiftAge() {
		return liftAge;
	}

	public void setLiftAge(String liftAge) {
		this.liftAge = liftAge;
	}

	@Override
	public String toString() {
		return "Lift [liftNo=" + liftNo + ", liftType=" + liftType + ", liftPrice=" + liftPrice + ", liftAge=" + liftAge
				+ "]";
	}

	
}
