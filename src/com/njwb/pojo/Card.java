package com.njwb.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class Card {
	private int cardId;
	private int userId;
	private String cardNumber;
	private String cardPwd;
	private BigDecimal cardAmount;
	private int cardProvId;
	private Date cardStartTime;
	private Date cardEndTime;
	private int cardStatus;
	private Date createTime;
	public Card() {
		super();
	}
	public Card(int cardId, int userId, String cardNumber, String cardPwd, BigDecimal cardAmount, int cardProvId, Date cardStartTime, Date cardEndTime, int cardStatus, Date createTime) {
		super();
		this.cardId = cardId;
		this.userId = userId;
		this.cardNumber = cardNumber;
		this.cardPwd = cardPwd;
		this.cardAmount = cardAmount;
		this.cardProvId = cardProvId;
		this.cardStartTime = cardStartTime;
		this.cardEndTime = cardEndTime;
		this.cardStatus = cardStatus;
		this.createTime = createTime;
	}
	public int getCardId() {
		return cardId;
	}
	public void setCardId(int cardId) {
		this.cardId = cardId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public String getCardPwd() {
		return cardPwd;
	}
	public void setCardPwd(String cardPwd) {
		this.cardPwd = cardPwd;
	}
	public BigDecimal getCardAmount() {
		return cardAmount;
	}
	public void setCardAmount(BigDecimal cardAmount) {
		this.cardAmount = cardAmount;
	}
	public int getCardProvId() {
		return cardProvId;
	}
	public void setCardProvId(int cardProvId) {
		this.cardProvId = cardProvId;
	}
	public Date getCardStartTime() {
		return cardStartTime;
	}
	public void setCardStartTime(Date cardStartTime) {
		this.cardStartTime = cardStartTime;
	}
	public Date getCardEndTime() {
		return cardEndTime;
	}
	public void setCardEndTime(Date cardEndTime) {
		this.cardEndTime = cardEndTime;
	}
	public int getCardStatus() {
		return cardStatus;
	}
	public void setCardStatus(int cardStatus) {
		this.cardStatus = cardStatus;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "Card [cardAmount=" + cardAmount + ", cardEndTIme=" + cardEndTime + ", cardId=" + cardId + ", cardNumber=" + cardNumber + ", cardProvId=" + cardProvId + ", cardPwd=" + cardPwd
				+ ", cardStartTime=" + cardStartTime + ", cardStatus=" + cardStatus + ", createTime=" + createTime + ", userId=" + userId + "]";
	}
}
