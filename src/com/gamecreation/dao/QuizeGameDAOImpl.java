package com.gamecreation.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.gamecreation.bo.QuizGameResultBO;
import com.gamecreation.bo.QuizeGameQuestionAnswerBO;

public class QuizeGameDAOImpl {

	
	private static final String INSERT_QUESTION_ANSWER_QUIZE_GAME = "INSERT INTO  question_deatil(quest,QA,QB,QC,QD,correctAns) VALUES(?,?,?,?,?,?)";
	private static final String SELECT_ALL_QUESTION_ANSWER_QUIZE_GAME = "SELECT * FROM question_deatil";
	private static final String GET_COUNT_OF_TOTAL_QUESTION = "SELECT COUNT(*) FROM question_deatil";
	private static final String INSERT_QUIZ_GAME_RESULT="INSERT INTO quize_game_user_result(userName,correctAnswer,incorrectAnswer,result,totalQuestion,stepCompletedName,usersteps,stepWisePercentage,totalObtainedMarks,totalObtainedPercentage) VALUES(?,?,?,?,?,?,?,?,?,?)";
	private static final String SELECT_USER_IS_AVAILABLE_OR_NOT = "SELECT COUNT(*) FROM quize_game_user_result WHERE userName = ? ";
	private static final String DELETE_USER_QUIZ_GAME_STATS = "DELETE FROM quize_game_user_result WHERE userName = ?";
	private static final String SELECT_USER_RESULT_BY_USER_NAME = "SELECT result FROM quize_game_user_result WHERE userName = ? ";
	private static final String SELECT_STEP_NAME_BY_UING_USER_NAME = "SELECT stepCompletedName FROM quize_game_user_result where userName = ?";
	private static final String QUERY_FOR_DELETING_USER_STATS_BY_USER_NAME_AND_STEPS_NAME = "DELETE FROM quize_game_user_result WHERE userName = ? and usersteps  = ?";
	private static final String SQL_QUERY_FOR_GETTING_USER_MARKS_AND_PERCENTAGE="SELECT correctAnswer,stepWisePercentage,totalObtainedMarks,totalObtainedPercentage FROM quize_game_user_result WHERE  userName = ? and stepCompletedName  = ?";
	private static final String SQL_QUERY_RETRIVING_USER_MARKS = "SELECT totalObtainedMarks  FROM quize_game_user_result WHERE userName = ? and stepCompletedName  = ?";
	/* 
	 * Insert Question and AnsWer DAO 
	 */
	public int insertQuestionAndAnswer(QuizeGameQuestionAnswerBO quizeBO)throws Exception{
		
	
		Connection con = null;
		 PreparedStatement ps = null;
		 int count = 0;
		 
		 try{
			 con = new DbConnector().getConnection();
			 
			 if(con != null) {
				 ps = con.prepareStatement(INSERT_QUESTION_ANSWER_QUIZE_GAME);
			 }
			 
			 if(ps!=null) {
				 ps.setString(1, quizeBO.getQuestionName());
				 ps.setString(2, quizeBO.getOptionA());
				 ps.setString(3, quizeBO.getOptionB());
				 ps.setString(4, quizeBO.getOptionC());
				 ps.setString(5, quizeBO.getOptionD());
				 ps.setString(6, quizeBO.getCorrectAnswer());
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
	 * fetch ALL Question and answer from database
	 */
	
	public List<QuizeGameQuestionAnswerBO> fetchAllQuestionAndAnswer() throws Exception{
		
		System.out.println("fetchAllQuestionAndAnswer method is callled..! ");
		Connection con = null;
		ResultSet rs	= null;
		PreparedStatement ps = null;
		boolean  result = false;
		List<QuizeGameQuestionAnswerBO> listQuizeGameCreationBO = new ArrayList();
		QuizeGameQuestionAnswerBO bo = null;
		
		try{
			con = new DbConnector().getConnection();
			 
			if(con != null) {
				 ps = con.prepareStatement(SELECT_ALL_QUESTION_ANSWER_QUIZE_GAME);
			}
			 
			if(ps!=null) {
				rs = ps.executeQuery();
			 }
			
			if(rs != null) {
				
				while(rs.next()){
					
					bo = new QuizeGameQuestionAnswerBO();
					
					bo.setqID(rs.getInt(1));
					bo.setQuestionName(rs.getString(2));
					bo.setOptionA(rs.getString(3));
					bo.setOptionB(rs.getString(4));
					bo.setOptionC(rs.getString(5));
					bo.setOptionD(rs.getString(6));
					bo.setCorrectAnswer(rs.getString(7));
					
					listQuizeGameCreationBO.add(bo);
				}
			}			
		 }catch(Exception e){
			 e.printStackTrace();
			 throw e;
		}
		 return listQuizeGameCreationBO;
		
	}
	
	/*
	 * get total count of question
	 */
	
	public int getTotalQuestionCount() throws Exception{
		Connection con = null;
		ResultSet rs	= null;
		PreparedStatement ps = null;
		int count = 0;
		
		try{
			con = new DbConnector().getConnection();
			 
			if(con != null) {
				 ps = con.prepareStatement(GET_COUNT_OF_TOTAL_QUESTION);
			}
			 
			if(ps!=null) {
				rs = ps.executeQuery();
			 }
			
			if(rs.next()) {
				count = rs.getInt(1);
			}			
		 }catch(Exception e){
			 e.printStackTrace();
			 throw e;
		}
		 return count;
	}
	
	/*
	 * inserting user QuizeGameResult by userName as argument
	 */
	
	public int insertQuizGameResultByUser(QuizGameResultBO quizeGameBO) throws Exception{
		
		Connection con = null;
		ResultSet rs	= null;
		PreparedStatement ps = null;
		int count = 0;
		
		
		try{
			con = new DbConnector().getConnection();
			 
			if(con != null) {
				 ps = con.prepareStatement(INSERT_QUIZ_GAME_RESULT);
			}
			 
			if(ps!=null) {
				ps.setString(1, quizeGameBO.getUserName());
				ps.setInt(2, quizeGameBO.getCorrectAnswer());
				ps.setInt(3, quizeGameBO.getIncorrectAnswer());
				ps.setString(4, quizeGameBO.getResult());
				ps.setInt(5, quizeGameBO.getTotalQuestion());
				ps.setString(6, quizeGameBO.getStepCompletedName());
				ps.setString(7,quizeGameBO.getUsersteps());
				ps.setDouble(8, quizeGameBO.getPercentage());
				ps.setInt(9, quizeGameBO.getTotalObtainedMarks());
				ps.setString(10, quizeGameBO.getTotalObtainedPercentage());
			 }
			
			if(ps != null) {
				count = ps.executeUpdate();
			}
			
		 }catch(Exception e){
			 e.printStackTrace();
			 throw e;
		}
		 return count;
	
	}
	/*
	 * 
	 *getting first step total marks 
	 */
	public int getTotalObtainedMarksByUserName(String userName,String completedStepName) throws Exception {
		Connection con = null;
		ResultSet rs	= null;
		PreparedStatement ps = null;
		int count = 0;
		
		try{
			con = new DbConnector().getConnection();
			 
			if(con != null) {
				 ps = con.prepareStatement(SQL_QUERY_RETRIVING_USER_MARKS);
			}
			 
			if(ps!=null) {
				ps.setString(1, userName);
				ps.setString(2, completedStepName);
				rs = ps.executeQuery();
			 }
			
			if(rs.next()) {
				count = rs.getInt(1);
			}			
		 }catch(Exception e){
			 e.printStackTrace();
			 throw e;
		}
		 return count;
	}
	/*
	 * get the user is available or not
	 */
	public int isUserAvailble(String userName)throws Exception{
		
		Connection con = null;
		ResultSet rs	= null;
		PreparedStatement ps = null;
		int count = 0;
		
		try{
			con = new DbConnector().getConnection();
			 
			if(con != null) {
				 ps = con.prepareStatement(SELECT_USER_IS_AVAILABLE_OR_NOT);
			}
			 
			if(ps!=null) {
				ps.setString(1, userName);
				rs = ps.executeQuery();
			 }
			
			if(rs.next()) {
				count = rs.getInt(1);
			}			
		 }catch(Exception e){
			 e.printStackTrace();
			 throw e;
		}
		 return count;
	}
	
	/* 
	 * delete user Quiz Game stats
	 * 
	 */
	
	public int deleteQiuzGameStatsByUserName(String userName) throws Exception {
		Connection con = null;
		ResultSet rs	= null;
		PreparedStatement ps = null;
		int count = 0;
		
		
		try{
			con = new DbConnector().getConnection();
			 
			if(con != null) {
				 ps = con.prepareStatement(DELETE_USER_QUIZ_GAME_STATS);
			}
			 
			if(ps!=null) {
				ps.setString(1,userName);
			 }
			
			if(ps != null) {
				count = ps.executeUpdate();
			}
			
		 }catch(Exception e){
			 e.printStackTrace();
			 throw e;
		}
		 return count;
	}
	
	/*
	 * 
	 * get user result from DB by name
	 */
	
	public String getUserResultByUserName(String userName) throws Exception {
		
		Connection con = null;
		ResultSet rs	= null;
		PreparedStatement ps = null;
		String result = null;
		
		
		try{
			con = new DbConnector().getConnection();
			 
			if(con != null) {
				 ps = con.prepareStatement(SELECT_USER_RESULT_BY_USER_NAME);
			}
			 
			if(ps!=null) {
				ps.setString(1,userName);
			 }
			
			if(ps != null) {
				rs = ps.executeQuery();
			}
			while(rs.next()) {
				result = rs.getString(1);
			}
		 }catch(Exception e){
			 e.printStackTrace();
			 throw e;
		}
		 return result;
	}
	
	/*
	 * This method will give StepCounteName by taking UserName As a argument
	 */
	
	public String getStepNameByUserName(String userName)throws Exception{
		Connection con = null;
		ResultSet rs	= null;
		PreparedStatement ps = null;
		String result = null;
		
		
		try{
			con = new DbConnector().getConnection();
			 
			if(con != null) {
				 ps = con.prepareStatement(SELECT_STEP_NAME_BY_UING_USER_NAME);
			}
			 
			if(ps!=null) {
				ps.setString(1,userName);
			 }
			
			if(ps != null) {
				rs = ps.executeQuery();
			}
			while(rs.next()) {
				result = rs.getString(1);
				//result = "#";
				//result = rs.getString(2);
			}
		 }catch(Exception e){
			 e.printStackTrace();
			 throw e;
		}
		 return result;
		
	}
	
	/*
	 * This method will delete user stats by taking userName and steps as input
	 */
	
	public int delteUserStatsByUserNameAndSteps(String userName,String stepName)throws Exception{
		Connection con = null;
		ResultSet rs	= null;
		PreparedStatement ps = null;
		int result = 0;
		
		
		try{
			con = new DbConnector().getConnection();
			 
			if(con != null) {
				 ps = con.prepareStatement(QUERY_FOR_DELETING_USER_STATS_BY_USER_NAME_AND_STEPS_NAME);
			}
			 
			if(ps!=null) {
				ps.setString(1,userName);
				ps.setString(2, stepName);
			 }
			
			if(ps != null) {
				result = ps.executeUpdate();
			}
			/*
			 * while(rs.next()) {
				result = rs.getString(1);
				//result = "#";
				//result = rs.getString(2);
		 }*/
		 }catch(Exception e){
			 e.printStackTrace();
			 throw e;
		}
		 return result;
		
	}

	/*
	 * This method will give marks and percentage of user step wise
	 */
	public String getMarksAndPercentageByUserNameAndStepName(String userName,String stepName) {
		String result = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		
		try {
			con = new DbConnector().getConnection();
			
			if(con != null) {
				ps = con.prepareStatement(SQL_QUERY_FOR_GETTING_USER_MARKS_AND_PERCENTAGE);
			}
			
			if(ps != null) {
				ps.setString(1, userName);
				ps.setString(2, stepName);
			
			}
			
			if(ps != null) {
				rs = ps.executeQuery();
			}
			
			if(rs != null) {
				while(rs.next()) {
					
					if(rs.getString(4) == null) {
						continue;
					}
					
					result = rs.getString(1)+"#"+rs.getString(2)+"#"+rs.getString(3)+"#"+rs.getString(4);
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return result ;
		
	}
	
	
	public static void main(String[] args) {
	
		
		try {
			/*
			 * String count = new
			 * QuizeGameDAOImpl().getMarksAndPercentageByUserNameAndStepName("karan",
			 * "second_step"); System.out.println("count :: "+count);
			 */
			
			 String result = new QuizeGameDAOImpl().getStepNameByUserName("Anjali");
			 
			 System.out.println("result : "+result);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
