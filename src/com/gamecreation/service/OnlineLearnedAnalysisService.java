package com.gamecreation.service;

import com.gamecreation.dao.OnlineLearningAnalysisImpl;

public class OnlineLearnedAnalysisService {
	
	
	public void doDataAnalysisOfOnlineLearning(String userName,String timeSpended) throws Exception {
		boolean daoResult = false;
		OnlineLearningAnalysisImpl onlineLearnedDAO = new OnlineLearningAnalysisImpl();
		int learningTime = 0;
		String timeSpendtoLearned = "";
		
		//checking user already learned or not
		//if learned then return true otherwuise return\
		//false
		daoResult = onlineLearnedDAO.checkUserAvailableOrNot(userName);
		
		//if not learned then insert the user record
		//using dao
		if(daoResult) {//if user stats already available
			//get How many time he learned value
			int currntLearningTime = onlineLearnedDAO.getTotalTimePlayed(userName);
			//increment by one of learningTime value
			learningTime = ++currntLearningTime;
			timeSpendtoLearned = timeSpended;
			onlineLearnedDAO.insertUserDataAnalysisRecord(userName, learningTime, timeSpendtoLearned);
			
			
		}else {//not available then insert with initilize value
			
			learningTime = 1; 
			timeSpendtoLearned = timeSpended;
			onlineLearnedDAO.insertUserDataAnalysisRecord(userName, learningTime, timeSpendtoLearned);
		}
		
	}
}
