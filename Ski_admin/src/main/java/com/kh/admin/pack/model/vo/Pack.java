package com.kh.admin.pack.model.vo;

import java.sql.Date;

public class Pack {
	
	private int packageNo;		//	PACKAGE_NO
	private String packageName;	//	PACKAGE_NAME
	private int packagePrice;	//	PACKAGE_PRICE
	private Date availableStartDate ;//	AVAILABLE_START_DATE
	private Date availableEndDate;	//	AVAILABLE_END_DATE
	private String productComposit;	//	PRODUCT_COMPOSIT
	private String packageSet;	//	PACKAGE_SET
	private String packageStatus;
	private String packOriginName;	//	PACK_ORIGIN_NAME
	private String packChangeName;	//	PACK_CHANGE_NAME
	private String packImgPath;	//	PACK_IMG_PATH	
	
	public Pack() {}

	public Pack(int packageNo, String packageName, int packagePrice, Date availableStartDate, Date availableEndDate,
			String productComposit, String packageSet, String packageStatus, String packOriginName,
			String packChangeName, String packImgPath) {
		super();
		this.packageNo = packageNo;
		this.packageName = packageName;
		this.packagePrice = packagePrice;
		this.availableStartDate = availableStartDate;
		this.availableEndDate = availableEndDate;
		this.productComposit = productComposit;
		this.packageSet = packageSet;
		this.packageStatus = packageStatus;
		this.packOriginName = packOriginName;
		this.packChangeName = packChangeName;
		this.packImgPath = packImgPath;
	}

	public int getPackageNo() {
		return packageNo;
	}

	public void setPackageNo(int packageNo) {
		this.packageNo = packageNo;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public int getPackagePrice() {
		return packagePrice;
	}

	public void setPackagePrice(int packagePrice) {
		this.packagePrice = packagePrice;
	}

	public Date getAvailableStartDate() {
		return availableStartDate;
	}

	public void setAvailableStartDate(Date availableStartDate) {
		this.availableStartDate = availableStartDate;
	}

	public Date getAvailableEndDate() {
		return availableEndDate;
	}

	public void setAvailableEndDate(Date availableEndDate) {
		this.availableEndDate = availableEndDate;
	}

	public String getProductComposit() {
		return productComposit;
	}

	public void setProductComposit(String productComposit) {
		this.productComposit = productComposit;
	}

	public String getPackageSet() {
		return packageSet;
	}

	public void setPackageSet(String packageSet) {
		this.packageSet = packageSet;
	}

	public String getPackageStatus() {
		return packageStatus;
	}

	public void setPackageStatus(String packageStatus) {
		this.packageStatus = packageStatus;
	}

	public String getPackOriginName() {
		return packOriginName;
	}

	public void setPackOriginName(String packOriginName) {
		this.packOriginName = packOriginName;
	}

	public String getPackChangeName() {
		return packChangeName;
	}

	public void setPackChangeName(String packChangeName) {
		this.packChangeName = packChangeName;
	}

	public String getPackImgPath() {
		return packImgPath;
	}

	public void setPackImgPath(String packImgPath) {
		this.packImgPath = packImgPath;
	}

	@Override
	public String toString() {
		return "Pack [packageNo=" + packageNo + ", packageName=" + packageName + ", packagePrice=" + packagePrice
				+ ", availableStartDate=" + availableStartDate + ", availableEndDate=" + availableEndDate
				+ ", productComposit=" + productComposit + ", packageSet=" + packageSet + ", packageStatus="
				+ packageStatus + ", packOriginName=" + packOriginName + ", packChangeName=" + packChangeName
				+ ", packImgPath=" + packImgPath + "]";
	}

	
	
}
