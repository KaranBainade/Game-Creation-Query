package com.gamecreation.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.gamecreation.bo.SurveyFormBO;

public class SurveyFormDAO {

	private static final String SQL_QUERY_INSERTING_SURVEY_FORM_DATA = "INSERT INTO survey_FORM(userName,email,age,desg,recommendFriend,improvement,comment) VALUES (?,?,?,?,?,?,?) ";
	
	/*
	 * this method will take survey form bo as input and return 
	 * number of row affeted in DB
	 */
	
	public int storeSurveyFormData(SurveyFormBO bo) throws Exception{
		Connection con = null;
		 PreparedStatement ps = null;
		 int count = 0;
		 
		 try{
			 con = new DbConnector().getConnection();
			 
			 if(con != null) {
				 ps = con.prepareStatement(SQL_QUERY_INSERTING_SURVEY_FORM_DATA);
			 }
			 
			 if(ps!=null) {
				 ps.setString(1,bo.getUserName());
				 ps.setString(2, bo.getEmail());
				 ps.setInt(3, bo.getAge());
				 ps.setString(4,bo.getCurrentRole());
				 ps.setString(5, bo.getRecommendFried());
				 ps.setString(6, bo.getImprovement());
				 ps.setString(7, bo.getComment());
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
