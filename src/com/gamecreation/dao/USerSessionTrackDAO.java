package com.gamecreation.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.gamecreation.bo.SurveyFormBO;
import com.gamecreation.bo.UserSessionTrackBO;

public class USerSessionTrackDAO {

private static final String SQL_QUERY_INSERTING_USER_SESSION_DATA = "INSERT INTO user_session_track(userName,loginTime,logoutTime,totalSession,gamePlayed,onlineLearned) VALUES (?,?,?,?,?,?) ";

	/*
	 * this method will take survey form bo as input and return 
	 * number of row affeted in DB
	 */
	
	public int storeSessionUserData(UserSessionTrackBO bo ) throws Exception{
		Connection con = null;
		 PreparedStatement ps = null;
		 int count = 0;
		 
		 try{
			 con = new DbConnector().getConnection();
			 
			 if(con != null) {
				 ps = con.prepareStatement(SQL_QUERY_INSERTING_USER_SESSION_DATA);
			 }
			 
			 if(ps!=null) {
				 ps.setString(1,bo.getUserName());
				 ps.setString(2, bo.getLoginTime());
				 ps.setString(3, bo.getLogoutTime());
				 ps.setString(4,bo.getTotalSession());
				 ps.setString(5, bo.getGamePlayed());
				 ps.setString(6, bo.getOnlineLearned());
			 }
			 
			 if(ps != null) {
				 count = ps.executeUpdate();
			 }			
			
		 }catch(Exception e){
				throw e;
		}
		 return count;
	}
}
