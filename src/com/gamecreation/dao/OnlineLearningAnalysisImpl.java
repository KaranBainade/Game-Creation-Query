package com.gamecreation.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.gamecreation.bo.PuzzleGameUserBO;

public class OnlineLearningAnalysisImpl {
	
	private static final String SQL_QUERY_TO_CHECK_USER_AVAILABILITY = "SELECT COUNT(*) FROM OnlineLearningAnalysis WHERE userName = ?";
	private static final String SQL_QUERY_INSERT_USER_DATA_ANLYSIS_STATS = "INSERT INTO  OnlineLearningAnalysis(userName,howManyTimeLearned,timeSpendedToLearn) VALUES (?,?,?)";
	private static final String SQL_QUERY_TO_GET_HOW_MANY_TIME_PLAYED_VALUE = "SELECT howManyTimeLearned FROM OnlineLearningAnalysis WHERE userName = ?";
	
	/**
	 * 
	 * @param userName
	 * @return
	 * @throws Exception
	 * 
	 * This method will check already user is available or not 
	 * if available then return true otherwise return false
	 */
	
	public boolean checkUserAvailableOrNot(String userName) throws Exception{
		boolean flag = false;
		Connection con = null;
		ResultSet rs	= null;
		PreparedStatement ps = null;
		int  result =  0;
		
		 try{
			 con = new DbConnector().getConnection();
			 
			 if(con != null) {
				 ps = con.prepareStatement(SQL_QUERY_TO_CHECK_USER_AVAILABILITY);
			 }
			 
			 if(ps!=null) {
				 ps.setString(1, userName);
			 }
			 
			 if(ps != null) {
				 rs = ps.executeQuery();
			 }
			 
			while(rs.next()) {
				if(rs.getInt(1) == 0) {
					flag = false;
				}else {
					flag = true;
				}
			}
			 
			 while(rs.next()) {
				 result = rs.getInt(1);
			 }
				 
			
		 }catch(Exception e){
				throw e;
		}
		// return result;
				
		return flag;
	}
	
	//insert login user record
	public boolean insertUserDataAnalysisRecord(String userName,int learningTime,String timeSpendtoLearned ) throws Exception {
		Connection con = null;
		 ResultSet rs	= null;
		 PreparedStatement ps = null;
		 boolean  flag = false;
		 int count = 0;
		 
		 try{
			 con = new DbConnector().getConnection();
			 
			 if(con != null) {
				 ps = con.prepareStatement(SQL_QUERY_INSERT_USER_DATA_ANLYSIS_STATS);
			 }
			 
			 if(ps!=null) {
				 ps.setString(1, userName);
				 ps.setInt(2, learningTime);
				 ps.setString(3,timeSpendtoLearned);
				
			 }
			 
			 if(ps != null) {
				 count = ps.executeUpdate();
			 }	
			 if(count != 0) {
				 flag = true;
			 }else {
				 flag = false;
			 }
			
		 }catch(Exception e){
				throw e;
		}
		// return count;
		return flag;
	}
	
	//get totalTimeLearned 
	public int getTotalTimePlayed(String userName) throws Exception {
		boolean flag = false;
		Connection con = null;
		ResultSet rs	= null;
		PreparedStatement ps = null;
		int  count =  0;
		
		 try{
			 con = new DbConnector().getConnection();
			 
			 if(con != null) {
				 ps = con.prepareStatement(SQL_QUERY_TO_GET_HOW_MANY_TIME_PLAYED_VALUE);
			 }
			 
			 if(ps!=null) {
				 ps.setString(1, userName);
			 }
			 
			 if(ps != null) {
				 rs = ps.executeQuery();
			 }
			 
			while(rs.next()) {
				count = rs.getInt(1);
			}
							 
			
		 }catch(Exception e){
				throw e;
		}		
		
		return count;
		
	}
	
	public static void main(String[] args) throws Exception {
		System.out.println("result :: "+new OnlineLearningAnalysisImpl().checkUserAvailableOrNot("karan"));
	}
}
