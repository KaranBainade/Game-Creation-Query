package com.gamecreation.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.gamecreation.dao.QuizGameDataAnalysisDAOImpl;

public class QuizGameDataAnalysisImpl {
	
	public void updateDataAnalysisOfQuizGame(String userName,String stepInTime,String stepOutTime,int stepNumber) throws Exception {
		
		QuizGameDataAnalysisDAOImpl dao = new QuizGameDataAnalysisDAOImpl();
		
		System.out.println("stepInTime :: "+stepInTime);
		System.out.println("stepOutTime :: "+stepOutTime);
		
		String time1 = stepInTime.split(" ")[1];
		String time2 = stepOutTime.split(" ")[1];

		SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
		Date date1 = format.parse(time1);
		Date date2 = format.parse(time2);

		long hour = Math.abs((date2.getHours() - date1.getHours()));
		long minut =  Math.abs((date2.getMinutes() - date1.getMinutes()));
		long second =  Math.abs((date2.getSeconds() - date1.getSeconds()));
		
		System.out.println("hour "+hour);
		System.out.println("minut "+minut);
		System.out.println("second "+second);
		
		// long HourMinutSecond =
		// ((date1.getHours()+date1.getMinutes()+date1.getSeconds())-(date2.getHours()+date2.getMinutes()+date2.getSeconds()));

		// System.out.println("HourMinutSecond "+HourMinutSecond);
		long difference = date2.getTime() - date1.getTime();// milliseconds

		String totalSession =hour+":"+minut+":"+second; 
			
		System.out.println("easy taken time step ::"+totalSession);
		
		String[] h1=totalSession.split(":");
		 
		int hour1=Integer.parseInt(h1[0]);
		int minute=Integer.parseInt(h1[1]);
		int second1=Integer.parseInt(h1[2]);
		 
		int temp;
		temp = second1 + (60 * minute) + (3600 * hour1);
		 
		 System.out.println("secondsss :: "+temp);
		
		
		if(stepNumber == 5){
			if( temp < 15 ) {///easy step
				dao.insertIntoEasyStepFewTimeTaken(userName, totalSession);
			}else {
				dao.insertIntoEasyStepMoreTimeTaken(userName, totalSession);
			}
			
		}else if(stepNumber == 10) {
			if( temp < 30 ) {// medium step
				dao.insertIntoMediumStepFewTimeTaken(userName, totalSession);
			}else {
				dao.insertIntoMeduiumStepMoreTimeTaken(userName, totalSession);
			}
			
		}else if(stepNumber == 15) {
			
			if( temp < 50 ) { //hard step
				dao.insertIntoHardStepFewTimeTaken(userName, totalSession);
			}else {
				dao.insertIntoHardStepMoreTimeTaken(userName, totalSession);
			}
			
		}
		
		
	}

}
