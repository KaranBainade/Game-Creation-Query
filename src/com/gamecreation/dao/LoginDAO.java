

package com.gamecreation.dao;


import java.sql.*;
import java.util.*;

 public class LoginDAO{
	 
	 private static final String SELECT_QUERY = "SELECT count(*) FROM registration where username=? and  password=?";
	 
	 public boolean loginUser(String username,String password)throws Exception{
		
		 Connection con = null;
		 boolean flag 	= false;
		 ResultSet rs	= null;
		 PreparedStatement ps = null;
		 int count = 0;
		 
		 try{
			 con = new DbConnector().getConnection();
			 
			 if(con != null) {
				 ps = con.prepareStatement(SELECT_QUERY);
			 }
			 
			 if(ps!=null) {
				 ps.setString(1, username);
				 ps.setString(2, password);
			 }
			 
			 if(ps != null) {
				 rs = ps.executeQuery();
			 }

			if(rs.next()){
				count = rs.getInt(1);
			}
			
			if(count==0) {
				 flag = false;
			}else {
				flag = true ;
			}
		}catch(Exception e){
			throw e;
		}
		 
		return flag;
	}
 }