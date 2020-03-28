package com.njwb.pojo;

import java.util.Date;
import java.util.Random;

import org.springframework.stereotype.Component;

@Component
public class VertificationCode {
	private int vcId;
	private String vcPhone;
	private String vcCode;
	private Date createTime;
	public VertificationCode() {
		super();
	}
	public VertificationCode(int vcId, String vcPhone, String vcCode, Date createTime) {
		super();
		this.vcId = vcId;
		this.vcPhone = vcPhone;
		this.vcCode = vcCode;
		this.createTime = createTime;
	}
	public int getVcId() {
		return vcId;
	}
	public void setVcId(int vcId) {
		this.vcId = vcId;
	}
	public String getVcPhone() {
		return vcPhone;
	}
	public void setVcPhone(String vcPhone) {
		this.vcPhone = vcPhone;
	}
	public String getVcCode() {
		return vcCode;
	}
	public void setVcCode(String vcCode) {
		this.vcCode = vcCode;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	/**
	 * 生成四位随机数
	 * @return
	 */
	public String generateRandom() {
		Random random = new Random();
		String result = random.nextInt(10000) + "";
		int ranLength = result.length();
		if (ranLength < 4) {
			for (int i =0;i < 4 - ranLength;i++) {
				result = "0" + result;
			}
		}
		return result;
	}
	@Override
	public String toString() {
		return "VertifivationCode [createTime=" + createTime + ", vcCode=" + vcCode + ", vcId=" + vcId + ", vcPhone=" + vcPhone + "]";
	}
}
