package com.njwb.pojo;

import java.util.Date;

public class Prepaid {
	private int prepId;
	private int prepUserId;
	private int prepCardId;
	private Date createTime;
	public Prepaid() {
		super();
	}
	public Prepaid(int prepId, int prepUserId, int prepCardId, Date createTime) {
		super();
		this.prepId = prepId;
		this.prepUserId = prepUserId;
		this.prepCardId = prepCardId;
		this.createTime = createTime;
	}
	public int getPrepId() {
		return prepId;
	}
	public void setPrepId(int prepId) {
		this.prepId = prepId;
	}
	public int getPrepUserId() {
		return prepUserId;
	}
	public void setPrepUserId(int prepUserId) {
		this.prepUserId = prepUserId;
	}
	public int getPrepCardId() {
		return prepCardId;
	}
	public void setPrepCardId(int prepCardId) {
		this.prepCardId = prepCardId;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "Prepaid [createTime=" + createTime + ", prepCardId=" + prepCardId + ", prepId=" + prepId + ", prepUserId=" + prepUserId + "]";
	}
}
