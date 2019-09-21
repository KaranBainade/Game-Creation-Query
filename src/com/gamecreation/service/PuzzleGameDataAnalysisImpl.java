package com.gamecreation.service;

import com.gamecreation.dao.PuzzleGameDataAnalysisDAOImpl;

public class PuzzleGameDataAnalysisImpl {
	

	// this method will update user Stats of Puzzle game 
	public void doDataAnalysisOfPuzzleGame(int timeTaken,int stepNumber,String userName) throws Exception {
		
		PuzzleGameDataAnalysisDAOImpl  dao = new PuzzleGameDataAnalysisDAOImpl();
		int result = 0;
		System.out.println(" time taken :: "+timeTaken);
		System.out.println("stepNumber :: "+stepNumber);
		
		String formatedTime = formatHHMMSS(timeTaken);
	
		if(stepNumber == 3) { //easy steps
			if( timeTaken < 30) { //easy Step with few Time i.e less than 30 secs.
				result = dao.insertIntoEasyStepFewTimeTaken(userName,formatedTime);
			}else {//easy Step with more  Time i.e greater than 30 secs.
				result = dao.insertIntoEasyStepMoreTimeTaken(userName,formatedTime);
			}
		}else if(stepNumber == 4) { //medium steps
			if( timeTaken < 100) { //medium Step with few Time i.e less than 100s secs.
				result = dao.insertIntoMediumStepFewTimeTaken(userName,formatedTime);
			}else {//medium Step with more  Time i.e greater than 100 secs.
				result = dao.insertIntoMeduiumStepMoreTimeTaken(userName,formatedTime);
			}
		}else if(stepNumber == 5) { //Hard steps
			if( timeTaken < 200) { //medium Step with few Time i.e less than 200 secs.
				result = dao.insertIntoHardStepFewTimeTaken(userName,formatedTime);
			}else {//medium Step with more  Time i.e greater than 200 secs.
				result = dao.insertIntoHardStepMoreTimeTaken(userName,formatedTime);
			}
		}
	}
	
	private String formatHHMMSS(int secondsCount){
	    //Calculate the seconds to display:
	    int seconds = secondsCount % 60;
	    secondsCount -= seconds;
	    //Calculate the minutes:
	    long minutesCount = secondsCount / 60;
	    long minutes = minutesCount % 60;
	    minutesCount -= minutes;
	    //Calculate the hours:
	    long hoursCount = minutesCount / 60;
	    //Build the String
	    return "" + hoursCount + ":" + minutes + ":" + seconds;
	}
}

