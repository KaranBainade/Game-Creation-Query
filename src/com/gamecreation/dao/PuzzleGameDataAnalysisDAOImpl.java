package com.gamecreation.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PuzzleGameDataAnalysisDAOImpl {
	
	private static final String SQL_QUERY_TO_INSERT_USERS_EASY_STEP_LESS_TIME_RECORD = "INSERT INTO PUZZLE_GAME_User_List_TO_Take_Less_Time_Complete_EASY_STEP(userName,timeTaken) VALUES(?,?)";
	private static final String SQL_QUERY_TO_INSERT_USERS_MEDIUM_STEP_LESS_TIME_RECORD = "INSERT INTO PUZZLE_GAME_User_List_TO_Take_Less_Time_Complete_MEDIUM_STEP(userName,timeTaken) VALUES(?,?)";
	private static final String SQL_QUERY_TO_INSERT_USERS_HARD_STEP_LESS_TIME_RECORD = "INSERT INTO PUZZLE_GAME_User_List_TO_Take_Less_Time_Complete_HARD_STEP(userName,timeTaken) VALUES(?,?)";
	private static final String SQL_QUERY_TO_INSERT_USERS_EASY_STEP_MORE_TIME_RECORD = "INSERT INTO PUZZLE_GAME_User_List_TO_Take_More_Time_Complete_EASY_STEP(userName,timeTaken) VALUES(?,?)";
	private static final String SQL_QUERY_TO_INSERT_USERS_MEDIUM_STEP_MORE_TIME_RECORD = "INSERT INTO PUZZLE_GAME_User_List_TO_Take_More_Time_Complete_MEDIUM_STEP(userName,timeTaken) VALUES(?,?)";
	private static final String SQL_QUERY_TO_INSERT_USERS_HARD_STEP_MORE_TIME_RECORD = "INSERT INTO PUZZLE_GAME_User_List_TO_Take_More_Time_Complete_HARD_STEP(userName,timeTaken) VALUES(?,?)";

	//this method will insert easy step few  time taken stats in DB
	//it take two args..
	public int insertIntoEasyStepFewTimeTaken(String userName,String timeTaken) throws Exception {
		
		Connection con = null;
		 ResultSet rs	= null;
		 PreparedStatement ps = null;
		 boolean  result = false;
		 int count = 0;
		 
		 try{
			 con = new DbConnector().getConnection();
			 
			 if(con != null) {
				 ps = con.prepareStatement(SQL_QUERY_TO_INSERT_USERS_EASY_STEP_LESS_TIME_RECORD);
			 }
			 
			 if(ps!=null) {
				 ps.setString(1, userName);
				 ps.setString(2, timeTaken);
				
			 }
			 
			 if(ps != null) {
				 count = ps.executeUpdate();
			 }			
			
		 }catch(Exception e){
				throw e;
		}
		 return count;
		
	}
	
	//this method will insert medium step few  time taken stats in DB
	//it take two args..
	public int insertIntoMediumStepFewTimeTaken(String userName,String timeTaken) throws Exception {
		
		Connection con = null;
		 ResultSet rs	= null;
		 PreparedStatement ps = null;
		 boolean  result = false;
		 int count = 0;
		 
		 try{
			 con = new DbConnector().getConnection();
			 
			 if(con != null) {
				 ps = con.prepareStatement(SQL_QUERY_TO_INSERT_USERS_MEDIUM_STEP_LESS_TIME_RECORD);
			 }
			 
			 if(ps!=null) {
				 ps.setString(1, userName);
				 ps.setString(2, timeTaken);
				
			 }
			 
			 if(ps != null) {
				 count = ps.executeUpdate();
			 }			
			
		 }catch(Exception e){
				throw e;
		}
		 return count;
	}
	
	//this method will insert Hard step few  time taken stats in DB
	//it take two args..
	public int insertIntoHardStepFewTimeTaken(String userName,String timeTaken) throws Exception {
		
		Connection con = null;
		 ResultSet rs	= null;
		 PreparedStatement ps = null;
		 boolean  result = false;
		 int count = 0;
		 
		 try{
			 con = new DbConnector().getConnection();
			 
			 if(con != null) {
				 ps = con.prepareStatement(SQL_QUERY_TO_INSERT_USERS_HARD_STEP_LESS_TIME_RECORD);
			 }
			 
			 if(ps!=null) {
				 ps.setString(1, userName);
				 ps.setString(2, timeTaken);
				
			 }
			 
			 if(ps != null) {
				 count = ps.executeUpdate();
			 }			
			
		 }catch(Exception e){
				throw e;
		}
		 return count;
	}
	
	//this method will insert easy step more  time taken stats in DB
	//it take two args..
	public int insertIntoEasyStepMoreTimeTaken(String userName,String timeTaken) throws Exception {
		Connection con = null;
		 ResultSet rs	= null;
		 PreparedStatement ps = null;
		 boolean  result = false;
		 int count = 0;
		 
		 try{
			 con = new DbConnector().getConnection();
			 
			 if(con != null) {
				 ps = con.prepareStatement(SQL_QUERY_TO_INSERT_USERS_EASY_STEP_MORE_TIME_RECORD);
			 }
			 
			 if(ps!=null) {
				 ps.setString(1, userName);
				 ps.setString(2, timeTaken);
			 }
			 
			 if(ps != null) {
				 count = ps.executeUpdate();
			 }			
			
		 }catch(Exception e){
				throw e;
		}
		 return count;
	}
	
	//this method will insert medium step more  time taken stats in DB
	//it take two args..
	public int insertIntoMeduiumStepMoreTimeTaken(String userName,String timeTaken) throws Exception {
		
		Connection con = null;
		 ResultSet rs	= null;
		 PreparedStatement ps = null;
		 boolean  result = false;
		 int count = 0;
		 
		 try{
			 con = new DbConnector().getConnection();
			 
			 if(con != null) {
				 ps = con.prepareStatement(SQL_QUERY_TO_INSERT_USERS_MEDIUM_STEP_MORE_TIME_RECORD);
			 }
			 
			 if(ps!=null) {
				 ps.setString(1, userName);
				 ps.setString(2, timeTaken);
			 }
			 
			 if(ps != null) {
				 count = ps.executeUpdate();
			 }			
			
		 }catch(Exception e){
				throw e;
		}
		 return count;
	}
	
	//this method will insert Hard step more  time taken stats in DB
	//it take two args..
	public int insertIntoHardStepMoreTimeTaken(String userName,String timeTaken) throws Exception {
		
		Connection con = null;
		 ResultSet rs	= null;
		 PreparedStatement ps = null;
		 boolean  result = false;
		 int count = 0;
		 
		 try{
			 con = new DbConnector().getConnection();
			 
			 if(con != null) {
				 ps = con.prepareStatement(SQL_QUERY_TO_INSERT_USERS_HARD_STEP_MORE_TIME_RECORD);
			 }
			 
			 if(ps!=null) {
				 ps.setString(1, userName);
				 ps.setString(2, timeTaken);
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
