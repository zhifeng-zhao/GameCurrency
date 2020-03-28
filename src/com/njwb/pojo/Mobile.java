package com.njwb.pojo;

public class Mobile {
	private int mobileId;
	private String mobileNumber;
	private String mobileArea;
	private String mobileType;
	private int mobilePostCode;
	public Mobile() {
		super();
	}
	public Mobile(int mobileId, String mobileNumber, String mobileArea, String mobileType, int mobilePostCode) {
		super();
		this.mobileId = mobileId;
		this.mobileNumber = mobileNumber;
		this.mobileArea = mobileArea;
		this.mobileType = mobileType;
		this.mobilePostCode = mobilePostCode;
	}
	public int getMobileId() {
		return mobileId;
	}
	public void setMobileId(int mobileId) {
		this.mobileId = mobileId;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getMobileArea() {
		return mobileArea;
	}
	public void setMobileArea(String mobileArea) {
		this.mobileArea = mobileArea;
	}
	public String getMobileType() {
		return mobileType;
	}
	public void setMobileType(String mobileType) {
		this.mobileType = mobileType;
	}
	public int getMobilePostCode() {
		return mobilePostCode;
	}
	public void setMobilePostCode(int mobilePostCode) {
		this.mobilePostCode = mobilePostCode;
	}
	@Override
	public String toString() {
		return "Mobile [mobileArea=" + mobileArea + ", mobileId=" + mobileId + ", mobileNumber=" + mobileNumber + ", mobilePostCode=" + mobilePostCode + ", mobileType=" + mobileType + "]";
	}
}
