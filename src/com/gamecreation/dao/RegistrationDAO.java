package com.gamecreation.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.gamecreation.vo.RegisterVO;

public class RegistrationDAO{
	
	private static final String REGISTRATION_INSERT_QUERY="INSERT INTO registration(name,email,mobile,dob,username,password,address) VALUES(?,?,?,?,?,?,?)";
	
    public boolean registration(RegisterVO vo) throws Exception{
    	
    	Connection       con = null;
    	PreparedStatement ps = null;
    	int  result = 0;
    	
    	try{
    		//getting connection object
           con=new DbConnector().getConnection();
           
           if(con!=null) {
            	ps=con.prepareStatement(REGISTRATION_INSERT_QUERY);
           }
           
           if(ps!=null) {
        	 
        	   ps.setString(1, vo.getName());
        	   ps.setString(2, vo.getEmail());
        	   ps.setString(3, vo.getContact());
        	   ps.setString(4, vo.getDOB());
        	   ps.setString(5, vo.getUsername());
        	   ps.setString(6, vo.getPassword());
        	   ps.setString(7,vo.getAddress());
        	   //ps.setString(8, vo.getSelectedUser());
        	   
           }
           
           if(ps!=null) {
            
        	   result = ps.executeUpdate();
           }
           
           if(result > 0) {
        	   return true;
           }else {
        	   return false;
           }
         
		}catch(Exception e){
			throw e;
        }
    }
}
