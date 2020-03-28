package com.njwb.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class Game {
	private int gameId;
	private String gameName;
	private int gameStatus;
	private int gameType;
	private String gameDevelopers;
	private String gameIntroduction;
	private String gameDetail;
	private String gameFiling;
	private String gameCover;
	private String gameScreen;
	private BigDecimal gameTriffe;
	private BigDecimal gameCurrency;
	private Date createTime;
	private Date updateTime;
	public Game() {
		super();
	}
	public Game(int gameId, String gameName, int gameStatus, int gameType, String gameDevelopers, String gameIntroduction, String gameDetail, String gameFiling, String gameCover, String gameScreen,
			BigDecimal gameTriffe, BigDecimal gameCurrency, Date createTime, Date updateTime) {
		super();
		this.gameId = gameId;
		this.gameName = gameName;
		this.gameStatus = gameStatus;
		this.gameType = gameType;
		this.gameDevelopers = gameDevelopers;
		this.gameIntroduction = gameIntroduction;
		this.gameDetail = gameDetail;
		this.gameFiling = gameFiling;
		this.gameCover = gameCover;
		this.gameScreen = gameScreen;
		this.gameTriffe = gameTriffe;
		this.gameCurrency = gameCurrency;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}
	public int getGameId() {
		return gameId;
	}
	public void setGameId(int gameId) {
		this.gameId = gameId;
	}
	public String getGameName() {
		return gameName;
	}
	public void setGameName(String gameName) {
		this.gameName = gameName;
	}
	public int getGameStatus() {
		return gameStatus;
	}
	public void setGameStatus(int gameStatus) {
		this.gameStatus = gameStatus;
	}
	public int getGameType() {
		return gameType;
	}
	public void setGameType(int gameType) {
		this.gameType = gameType;
	}
	public String getGameDevelopers() {
		return gameDevelopers;
	}
	public void setGameDevelopers(String gameDevelopers) {
		this.gameDevelopers = gameDevelopers;
	}
	public String getGameIntroduction() {
		return gameIntroduction;
	}
	public void setGameIntroduction(String gameIntroduction) {
		this.gameIntroduction = gameIntroduction;
	}
	public String getGameDetail() {
		return gameDetail;
	}
	public void setGameDetail(String gameDetail) {
		this.gameDetail = gameDetail;
	}
	public String getGameFiling() {
		return gameFiling;
	}
	public void setGameFiling(String gameFiling) {
		this.gameFiling = gameFiling;
	}
	public String getGameCover() {
		return gameCover;
	}
	public void setGameCover(String gameCover) {
		this.gameCover = gameCover;
	}
	public String getGameScreen() {
		return gameScreen;
	}
	public void setGameScreen(String gameScreen) {
		this.gameScreen = gameScreen;
	}
	public BigDecimal getGameTriffe() {
		return gameTriffe;
	}
	public void setGameTriffe(BigDecimal gameTriffe) {
		this.gameTriffe = gameTriffe;
	}
	public BigDecimal getGameCurrency() {
		return gameCurrency;
	}
	public void setGameCurrency(BigDecimal gameCurrency) {
		this.gameCurrency = gameCurrency;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	@Override
	public String toString() {
		return "Game [createTime=" + createTime + ", gameCover=" + gameCover + ", gameCurrency=" + gameCurrency + ", gameDetail=" + gameDetail + ", gameDevelopers=" + gameDevelopers + ", gameFiling="
				+ gameFiling + ", gameId=" + gameId + ", gameIntroduction=" + gameIntroduction + ", gameName=" + gameName + ", gameScreen=" + gameScreen + ", gameStatus=" + gameStatus
				+ ", gameTriffe=" + gameTriffe + ", gameType=" + gameType + ", updateTime=" + updateTime + "]";
	}
}
