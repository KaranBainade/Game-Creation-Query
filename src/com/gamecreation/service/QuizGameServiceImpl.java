package com.gamecreation.service;

import java.text.DecimalFormat;
import java.util.Map;

import com.gamecreation.bo.QuizGameResultBO;
import com.gamecreation.dao.QuizeGameDAOImpl;

public class QuizGameServiceImpl {
	
	/*
	 * This method will take Map object as param to calculate result of user
	 * who played Quiz game and send result to DAO to store in persistance
	 * store 
	 */
	public String userQuizeGameResultUpdate(Map<Integer,String> qResultMap,int count,String userName) throws Exception{
		
		int correctAnsCount = 0;
		int inCorrectAnsCount = 0;
		QuizeGameDAOImpl quizDAO = new QuizeGameDAOImpl();
		int daoResult  =  0;
		double percentage = 0;
		String quizGameResult = null;
		QuizGameResultBO bo = new QuizGameResultBO();
		String serviceResult = null; 
		String StepCompletedName = null;
		int key = 0;
		String stepName = null;
		DecimalFormat numberFormat = new DecimalFormat("#.00");
		int totalObtainedMarks = 0;
		String totalObtainedPercentage = null;
		
		
		int totalStepQustionCount = 0;
		
		//process the Map object and stores count of correct and incorrect count 
		for(Map.Entry<Integer, String> map : qResultMap.entrySet()) {
			System.out.println("key :: "+map.getKey());
			System.out.println("value :: "+map.getValue());
			String answer = map.getValue();
			key = map.getKey();
			
			if(answer.equalsIgnoreCase("correct")) {
				correctAnsCount++;
			}else if(answer.equalsIgnoreCase("incorrect")) {
				inCorrectAnsCount++;
			}
			totalStepQustionCount++;
		}
		
		//calculate result of user 
		System.out.println("correct ANS count :: "+correctAnsCount);
		System.out.println("count :: "+count);
		System.out.println("totalStepQustionCount :: "+totalStepQustionCount);
		percentage = ((double)correctAnsCount / totalStepQustionCount) * 100;
		System.out.println("percantage :: "+percentage);
		
		if(percentage < 40) {
			quizGameResult = "Fail";
		}else {
			quizGameResult = "pass";
		}
		
		// if user is pass then he completed first step
		if(quizGameResult.equalsIgnoreCase("pass")) {
			if(key == 5) {
				StepCompletedName = "First_Step_Completed";
				stepName = "First_Step";
				
				//calulate total marks and percentage of all step played by user 
				totalObtainedMarks = correctAnsCount;
				totalObtainedPercentage = percentage+"%";
				
			}else if(key == 10){
				StepCompletedName = "second_Step_Completed";
				stepName = "Second_Step";
				//get First step total Marks from dao
				int firstStepResult = quizDAO.getTotalObtainedMarksByUserName(userName, "First_Step_Completed");
				
				//calulate total marks and percentage of all step played by user 
				totalObtainedMarks = firstStepResult+correctAnsCount;
				
				totalObtainedPercentage = (numberFormat.format(((double)totalObtainedMarks / 10) * 100))+"%";
				
			}else if(key == 15) {
				StepCompletedName = "Third_Step_Completed";
				stepName = "Third_Step";
				
				//get First step total Marks from dao
				int secondStepResult = quizDAO.getTotalObtainedMarksByUserName(userName, "second_Step_Completed");
				
				//calulate total marks and percentage of all step played by user 
				totalObtainedMarks = secondStepResult+correctAnsCount;
				
				totalObtainedPercentage = (numberFormat.format(((double)totalObtainedMarks / 15) * 100))+"%";
				
			}
		}else if(quizGameResult.equalsIgnoreCase("fail")) {
			if(key == 5 ) {
				StepCompletedName = "First_Step_NOT_Completed";
				stepName = "First_Step";
			}else if(key == 10){
				StepCompletedName = "First_Step_Completed";
				stepName = "Second_Step";
			}else if(key == 15) {
				StepCompletedName = "second_Step_Completed";
				stepName = "Third_Step";
			}
		}
		//use DAO 
		try{
			//set Bo value
			bo.setUserName(userName);
			bo.setCorrectAnswer(correctAnsCount);
			bo.setIncorrectAnswer(inCorrectAnsCount);
			bo.setResult(quizGameResult);
			bo.setTotalQuestion(count);
			bo.setStepCompletedName(StepCompletedName);
			bo.setUsersteps(stepName);
			bo.setPercentage(percentage);
			bo.setTotalObtainedMarks(totalObtainedMarks);
			bo.setTotalObtainedPercentage(totalObtainedPercentage);
			
			
			daoResult = quizDAO.insertQuizGameResultByUser(bo);
			
			if(daoResult == 0) {
				serviceResult = "not submited";
			}else {
				serviceResult = "submit";
			}
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return serviceResult;
	} 
	
	/*
	 * This method will return Quiz Game user completed step by taking user name
	 * 	as param  
	 */
	
	public int getUserCompletedStepByUserName(String userName) throws Exception{
		int userCompletedStep = 0;
		
		try {
			
			String userCompletedStepName = new QuizeGameDAOImpl().getStepNameByUserName(userName);
			System.out.println(" userCompletedStepName "+userCompletedStepName);
			if(userCompletedStepName.equals("First_Step_Completed")) {
				userCompletedStep = 1;//if user completed first step
			}else if(userCompletedStepName.equals("second_Step_Completed")) {
				userCompletedStep = 2;//if user completed second step
			}else if(userCompletedStepName.equals("Third_Step_Completed")){
				userCompletedStep = 3;//if user completed third step
			}else if(userCompletedStepName.equals("First_Step_NOT_Completed")) {
				userCompletedStep = 0; 
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
		return userCompletedStep;
	}

	
	
	public static void main(String[] args) {
		
		double number = 0.9999999999999;
		DecimalFormat numberFormat = new DecimalFormat("#.00");
		System.out.println(numberFormat.format(number));
		
		String i = (((double)10 / 15) * 100)+"%";
		System.out.println(numberFormat.format((((double)10 / 15) * 100)));
		
		System.out.println(i);
	}
}
