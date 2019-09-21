package com.gamecreation.vo;

public class UserSessionTrackVO {
	
	private String userName;
	private String loginTime;
	private String logoutTime;
	private String totalSession;
	private String gamePlayed;
	private String onlineLearned;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(String loginTime) {
		this.loginTime = loginTime;
	}
	public String getLogoutTime() {
		return logoutTime;
	}
	public void setLogoutTime(String logoutTime) {
		this.logoutTime = logoutTime;
	}
	public String getTotalSession() {
		return totalSession;
	}
	public void setTotalSession(String totalSession) {
		this.totalSession = totalSession;
	}
	public String getGamePlayed() {
		return gamePlayed;
	}
	public void setGamePlayed(String gamePlayed) {
		this.gamePlayed = gamePlayed;
	}
	public String getOnlineLearned() {
		return onlineLearned;
	}
	public void setOnlineLearned(String onlineLearned) {
		this.onlineLearned = onlineLearned;
	}
	
	
	@Override
	public String toString() {
		return "UserSessionTrackVO [userName=" + userName + ", loginTime=" + loginTime + ", logoutTime=" + logoutTime
				+ ", totalSession=" + totalSession + ", gamePlayed=" + gamePlayed + ", onlineLearned=" + onlineLearned
				+ "]";
	}
	
	

}
