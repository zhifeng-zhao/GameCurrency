package com.njwb.pojo;

public class Province {
	private int provId;
	private String provName;
	public Province() {
		super();
	}
	public Province(int provId, String provName) {
		super();
		this.provId = provId;
		this.provName = provName;
	}
	public int getProvId() {
		return provId;
	}
	public void setProvId(int provId) {
		this.provId = provId;
	}
	public String getProvName() {
		return provName;
	}
	public void setProvName(String provName) {
		this.provName = provName;
	}
	@Override
	public String toString() {
		return "Province [provId=" + provId + ", provName=" + provName + "]";
	}
}
