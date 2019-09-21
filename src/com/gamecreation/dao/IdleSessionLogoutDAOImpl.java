package com.gamecreation.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.gamecreation.bo.UserSessionTrackBO;

public class IdleSessionLogoutDAOImpl {
	
	private static final String SQL_QUERY_INSERTING_IDLE_SESSION_USER_INFO = "INSERT INTO idlesessionlogoutdetail(userName,pageNameWhereSessionInActivate,timeWhenSessionInActivate) VALUES (?,?,?) ";

	/*
	 * this method will take survey form bo as input and return 
	 * number of row affeted in DB
	 */
	
	public int storeSessionUserData(String userName,String pageNameWhereSessionInActivate,String timeWhenSessionInActivate  ) throws Exception{
		Connection con = null;
		 PreparedStatement ps = null;
		 int count = 0;
		 
		 try{
			 con = new DbConnector().getConnection();
			 
			 if(con != null) {
				 ps = con.prepareStatement(SQL_QUERY_INSERTING_IDLE_SESSION_USER_INFO);
			 }
			 
			 if(ps!=null) {
				 ps.setString(1,userName);
				 ps.setString(2, pageNameWhereSessionInActivate);
				 ps.setString(3,timeWhenSessionInActivate);
				 
				/* ps.setString(4,bo.getTotalSession());
				 ps.setString(5, bo.getGamePlayed());
				 ps.setString(6, bo.getOnlineLearned());*/
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
