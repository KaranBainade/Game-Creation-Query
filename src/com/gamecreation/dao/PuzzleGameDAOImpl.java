package com.gamecreation.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.gamecreation.bo.PuzzleGameUserBO;

public class PuzzleGameDAOImpl {

	private static final String INSERT_PUZZLE_GAME_USER="INSERT INTO  puzzle_game(userName,modeValue,steps,time) VALUES(?,?,?,?)";
	private static final String SELECT_MODE_VALUE_BY_USER_NAME = "SELECT modeValue FROM puzzle_game WHERE userName = ?";
	private static final String UPDATE_MODE_VALUE_BY_USER_NAME = "UPDATE puzzle_game SET modeValue = ?  where userName = ? ";
	private static final String UPDATE_PUZZLE_GAME_STATES_BY_USER_NAME = " UPDATE  puzzle_game SET steps = ?,time = ?,modeValue = ? WHERE userName = ? and modeValue=?";
	private static final String SQL_QUERY_FOR_DELETING_ALL_PUZZLE_GAME_STATS_BY_USER_NAME="DELETE FROM puzzle_game WHERE userName = ?";
	
	private static final String SQL_QUERY_TO_RETRIVE_PUZZLE_STATS ="SELECT * FROM  puzzle_game WHERE userName = ?";
	/*
	 * insert user Information who played puzzle game 
	 * 
	 */
	
	public int insertUserData(PuzzleGameUserBO  userBO) throws Exception{
		
		Connection con = null;
		 ResultSet rs	= null;
		 PreparedStatement ps = null;
		 boolean  result = false;
		 int count = 0;
		 
		 try{
			 con = new DbConnector().getConnection();
			 
			 if(con != null) {
				 ps = con.prepareStatement(INSERT_PUZZLE_GAME_USER);
			 }
			 
			 if(ps!=null) {
				 ps.setString(1, userBO.getUserName());
				 ps.setInt(2, userBO.getModeValue());
				 ps.setInt(3,userBO.getSteps());
				 ps.setInt(4, userBO.getTime());
			 }
			 
			 if(ps != null) {
				 count = ps.executeUpdate();
			 }			
			
		 }catch(Exception e){
				throw e;
		}
		 return count;
	}
	
	/*
	 * fetch user Mode value by user name
	 */
	public int getUserModeValueByUserName(String userName)throws Exception{
		Connection con = null;
		ResultSet rs	= null;
		PreparedStatement ps = null;
		int  result =  0;
		
		 
		 try{
			 con = new DbConnector().getConnection();
			 
			 if(con != null) {
				 ps = con.prepareStatement(SELECT_MODE_VALUE_BY_USER_NAME);
			 }
			 
			 if(ps!=null) {
				 ps.setString(1, userName);
			 }
			 
			 if(ps != null) {
				 rs = ps.executeQuery();
			 }
			 
			 while(rs.next()) {
				 result = rs.getInt(1);
			 }
				 
			
		 }catch(Exception e){
				throw e;
		}
		 return result;
		
	}
	
	/*
	 * update mode value if user completed one step
	 * 
	 */
	
	public int updateModeValueByUserName(String userName,int modeValue)throws Exception{
		Connection con = null;
		ResultSet rs	= null;
		PreparedStatement ps = null;
		String  result =  null;
		int count = 0;
		 
		 try{
			 con = new DbConnector().getConnection();
			 
			 if(con != null) {
				 ps = con.prepareStatement(UPDATE_MODE_VALUE_BY_USER_NAME);
			 }
			 
			 if(ps!=null) {
				 ps.setString(2, userName);
				 ps.setInt(1, modeValue);
			 }
			 
			 if(ps != null) {
				 count = ps.executeUpdate();
			 }
				 
			
		 }catch(Exception e){
				throw e;
		}
		 return count;
	}
	
	/*
	 * update puzzle game states of user
	 * 
	 */
	public int updatePuzzleGameStatesByUserName(String userName,int stepCount,int timeCount,int modeValue) throws Exception{
		Connection con = null;
		ResultSet rs	= null;
		PreparedStatement ps = null;
		String  result =  null;
		int count = 0;
		 
		 try{
			 con = new DbConnector().getConnection();
			 
			 if(con != null) {
				 ps = con.prepareStatement(UPDATE_PUZZLE_GAME_STATES_BY_USER_NAME);
			 }
			 
			 if(ps!=null) {
				 ps.setString(4, userName);
				 ps.setInt(5, modeValue);
				 ps.setInt(1, stepCount);
				 ps.setInt(2, timeCount);
				 ps.setInt(3, modeValue);
			 }
			 
			 if(ps != null) {
				 count = ps.executeUpdate();
			 }
				 
			
		 }catch(Exception e){
				throw e;
		}
		 return count;
	}
	
	
	/*
	 * delete all the stats of user
	 */
	public int deletePuzzlGameStatsByUser(String userName) throws Exception{
		
		Connection con = null;
		ResultSet rs	= null;
		PreparedStatement ps = null;
		String  result =  null;
		int count = 0;
		 
		 try{
			 con = new DbConnector().getConnection();
			 
			 if(con != null) {
				 ps = con.prepareStatement(SQL_QUERY_FOR_DELETING_ALL_PUZZLE_GAME_STATS_BY_USER_NAME);
			 }
			 
			 if(ps!=null) {
				 ps.setString(1, userName);
				
			 }
			 
			 if(ps != null) {
				 count = ps.executeUpdate();
			 }
				 
			
		 }catch(Exception e){
				throw e;
		}
		 return count;
	}
	
	/*
	 * 
	 * get Puzzle game stats by userName
	 */
	
	public List<PuzzleGameUserBO> getPuzzleGameStatsByUserName(String userName) throws Exception{
		List<PuzzleGameUserBO> listBO = new ArrayList();
		Connection con = null;
		ResultSet rs	= null;
		PreparedStatement ps = null;
		int  result =  0;
		
		 
		 try{
			 con = new DbConnector().getConnection();
			 
			 if(con != null) {
				 ps = con.prepareStatement(SQL_QUERY_TO_RETRIVE_PUZZLE_STATS);
			 }
			 
			 if(ps!=null) {
				 ps.setString(1, userName);
			 }
			 
			 if(ps != null) {
				 rs = ps.executeQuery();
			 }
			 
			while(rs.next()) {
				PuzzleGameUserBO bo = new PuzzleGameUserBO();
				bo.setUserID(rs.getInt(1));
				bo.setUserName(rs.getString(2));
				bo.setModeValue(rs.getInt(3));
				bo.setTime(rs.getInt(4));
				bo.setSteps(rs.getInt(5));
				
				listBO.add(bo);
				
			}
			 
			 while(rs.next()) {
				 result = rs.getInt(1);
			 }
				 
			
		 }catch(Exception e){
				throw e;
		}
		// return result;
		
		
		
		return listBO;
	}
	
	public static void main(String[] args) {
		
		
		/*PuzzleGameUserBO userBO = new PuzzleGameUserBO();
		userBO.setUserName("KARAN");
		userBO.setModeValue(0);
		userBO.setSteps(10);
		userBO.setTime(15);
		userBO.setComment("IT was Awsome..!");;
		try {
			int count = new PuzzleGameDAOImpl().insertUserData(userBO);
			System.out.println("count ::: "+count);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		try {
			//System.out.println("mode value is "+new PuzzleGameDAOImpl().getUserModeValueByUserName("shiv"));
			System.out.println("mode value is "+new PuzzleGameDAOImpl().getPuzzleGameStatsByUserName("Karan"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
