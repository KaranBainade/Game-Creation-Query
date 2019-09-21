package com.gamecreation.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gamecreation.bo.PuzzleGameUserBO;
import com.gamecreation.dao.PuzzleGameDAOImpl;
import com.gamecreation.dao.QuizeGameDAOImpl;
import com.gamecreation.dao.UserDaoImpl;


@WebServlet("/dashboardUrl")
public class DashboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		
		QuizeGameDAOImpl dao = new QuizeGameDAOImpl();
		String user = (String)session.getAttribute("username");
		String pass = (String)session.getAttribute("password");
		
	
		System.out.println(" user Name :: "+user);
		System.out.println("password :: "+pass);
		
		int modeValue = 0;
		int pointLeftValue = 0;
		
		
		int quizGameStepPercantage = 0;
		int poiLeftValueForQuizGame = 0;
		
		int firstModePuzzleTime = 0;
		int firstModeStepsCount = 0;
		
		int secondModePuzzleTime = 0;
		int secondModeStepsCount = 0;
		
		int thirdModePuzzleTime = 0;
		int thirdModeStepsCount = 0;
		
		try {
			//fetch user Data from database
			String userName = new UserDaoImpl().fechUserName(user, pass);
			
			//keep userName in request Scope
			//request.setAttribute("userName", userName);
			
			//put userName in session scope to access all over the application
			request.getSession().setAttribute("userName", userName);
			//fetch the steps of game
			
			//checking whether user already played puzzle game or not
			//if condition true means user is already played game played puzzle game
			if (new UserDaoImpl().checkUserIsAvailable(userName)) {
				
				//########### Puzzle Game ########################################
				
				//get user Puzzle Modes value 
				modeValue = new PuzzleGameDAOImpl().getUserModeValueByUserName(userName);
				
				//gettting alll puzzle game stats
				List<PuzzleGameUserBO> listBO =  new PuzzleGameDAOImpl().getPuzzleGameStatsByUserName(userName);
				
				for(PuzzleGameUserBO bo : listBO) {
				
					if(bo.getModeValue()==3) {
						firstModePuzzleTime = bo.getTime();
						firstModeStepsCount = bo.getSteps();
						
						session.setAttribute("firstModePuzzleTime", firstModePuzzleTime);
						session.setAttribute("firstModeStepsCount", firstModeStepsCount);
					}
					
					if(bo.getModeValue() == 4) {
						secondModePuzzleTime = bo.getTime();
						secondModeStepsCount = bo.getSteps();
						
						session.setAttribute("secondModePuzzleTime", secondModePuzzleTime);
						session.setAttribute("secondModeStepsCount", secondModeStepsCount);
						
					}
					
					if(bo.getModeValue() == 5) {
						
						thirdModePuzzleTime = bo.getTime();
						thirdModeStepsCount = bo.getSteps();
						
						session.setAttribute("thirdModePuzzleTime", thirdModePuzzleTime);
						session.setAttribute("thirdModeStepsCount", thirdModeStepsCount);
						
					}
					
				}
				
				if(modeValue == 3) {
					pointLeftValue = 1;
					modeValue = 34;
				}else if(modeValue == 4) {
					pointLeftValue = 2;
					modeValue = 65;
				}else if(modeValue == 5) {
					pointLeftValue = 3;
					modeValue = 100;
				}
				
				//################## Quiz Game #############################
				System.out.println("user Name beforegetStepNameByUserName() call "+userName);
				String userCompletedStepName = dao.getStepNameByUserName(userName);
				
				System.out.println("userCompletedStepName :: "+userCompletedStepName);
				
				//if user completed this steps then
				if (userCompletedStepName != null) {
					if (userCompletedStepName.equalsIgnoreCase("First_Step_Completed")) {
						//get mark and percentage from dao
						String firstStepResult = dao.getMarksAndPercentageByUserNameAndStepName(userName, userCompletedStepName);
						session.setAttribute("firstStepResult", firstStepResult.split("#"));
						System.out.println(firstStepResult);
						
						quizGameStepPercantage = 34;
						poiLeftValueForQuizGame = 1;
						session.setAttribute("i", 5);
					} else if (userCompletedStepName.equalsIgnoreCase("second_Step_Completed")) {
						
						String firstStepResult = dao.getMarksAndPercentageByUserNameAndStepName(userName, "First_Step_Completed");
						session.setAttribute("firstStepResult", firstStepResult.split("#"));
						System.out.println(firstStepResult);
						
						//get mark and percentage from dao
						String secondStepResult = dao.getMarksAndPercentageByUserNameAndStepName(userName, userCompletedStepName);
						System.out.println(secondStepResult);
						
						session.setAttribute("secondStepResult", secondStepResult.split("#"));
						
						quizGameStepPercantage = 65;
						poiLeftValueForQuizGame = 2;
						session.setAttribute("i", 10);
					} else if (userCompletedStepName.equalsIgnoreCase("Third_Step_Completed")) {
						
						String firstStepResult = dao.getMarksAndPercentageByUserNameAndStepName(userName, "First_Step_Completed");
						session.setAttribute("firstStepResult", firstStepResult.split("#"));
						System.out.println(firstStepResult);
						
						//get mark and percentage from dao
						String secondStepResult = dao.getMarksAndPercentageByUserNameAndStepName(userName, "second_Step_Completed");
						System.out.println(secondStepResult);
						
						session.setAttribute("secondStepResult", secondStepResult.split("#"));
						
						
						//get mark and percentage from dao
						String thirdStepResult = dao.getMarksAndPercentageByUserNameAndStepName(userName, userCompletedStepName);
						System.out.println(thirdStepResult);
						session.setAttribute("thirdStepResult", thirdStepResult.split("#"));
						
						quizGameStepPercantage = 100;
						poiLeftValueForQuizGame = 3;
					} else if (userCompletedStepName.equalsIgnoreCase("First_Step_NOT_Completed")) {
						quizGameStepPercantage = 0;
						poiLeftValueForQuizGame = 0;
					}
				}
			}
			else {
				modeValue = 0;
				pointLeftValue = 0;
				quizGameStepPercantage = 0;
				poiLeftValueForQuizGame = 0;
			}
			
			//keep in request scope 
			request.setAttribute("pointLeftValue", pointLeftValue);
			request.setAttribute("dash-Mode-Value", modeValue);
			
			//keep Quiz game data in request scope
			System.out.println(quizGameStepPercantage+ " "+poiLeftValueForQuizGame);
			request.setAttribute("quizGameStepPercantage", quizGameStepPercantage);
			request.setAttribute("poiLeftValueForQuizGame", poiLeftValueForQuizGame);
			
			rd = request.getRequestDispatcher("homepage.jsp");
			rd.forward(request, response);
			
		}catch(Exception e) {
			e.printStackTrace();
			rd = request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
