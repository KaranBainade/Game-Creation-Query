package com.gamecreation.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDaoImpl {

	private static final String SELECT_QUERY = "SELECT username FROM registration where username=? and  password=?";
	private static final String SELECT_QUERY_CHECK_USER_PLYED_PUZZLE_GAME_OR_NOT = "SELECT count(*) FROM puzzle_game where userName=?";
	
	public String fechUserName(String user, String password) throws Exception {
		Connection con = null;
		boolean flag = false;
		ResultSet rs = null;
		PreparedStatement ps = null;
		String result = null;

		try {
			con = new DbConnector().getConnection();

			if (con != null) {
				ps = con.prepareStatement(SELECT_QUERY);
			}

			if (ps != null) {
				ps.setString(1, user);
				ps.setString(2, password);
			}

			if (ps != null) {
				rs = ps.executeQuery();
			}

			if (rs.next()) {
				result = rs.getString(1);
			}
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	/*
	 * checking whether user already puzzzle game played or not
	 */

	public boolean checkUserIsAvailable(String userName)  throws Exception{
			Connection con = null;
			 ResultSet rs	= null;
			 PreparedStatement ps = null;
			 boolean  result = false;
			 int count = 0;
			 
			 try{
				 con = new DbConnector().getConnection();
				 
				 if(con != null) {
					 ps = con.prepareStatement(SELECT_QUERY_CHECK_USER_PLYED_PUZZLE_GAME_OR_NOT);
				 }
				 
				 if(ps!=null) {
					 ps.setString(1, userName);
				 }
				 
				 if(ps != null) {
					 rs = ps.executeQuery();
				 }

				if(rs.next()){
					count = rs.getInt(1);
				}
				if(count==0) {
					result = false;
				}else {
					result = true;
				}
				
			 }catch(Exception e){
				 e.printStackTrace();
				throw e;
			}
			 return result;
			
		}

	public static void main(String[] args) {
		try {
			boolean str = new UserDaoImpl().checkUserIsAvailable("karan");

			System.out.println("str : " + str);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
