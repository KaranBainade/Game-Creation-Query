package com.gamecreation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gamecreation.bo.QuizeGameQuestionAnswerBO;
import com.gamecreation.dao.QuizeGameDAOImpl;
import com.gamecreation.service.QuizGameDataAnalysisImpl;
import com.gamecreation.service.QuizGameServiceImpl;


@WebServlet("/quizeGameUrl")
public class QuizeGameController extends HttpServlet {
	
	
	int dataFetcher = 0;
	int count = 0;
	//stored all Question and its option in this instance varible.
	//so no need to hit database each and every time.
	List<QuizeGameQuestionAnswerBO> listQuizeGameCreationBO  = null;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		String action = request.getParameter("action");
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		QuizeGameQuestionAnswerBO quizeGameBO = null;
		String userName = (String)session.getAttribute("username");
		//QuizeGameDAOImpl QuizGameDAO = new QuizeGameDAOImpl();
		int sesI = (Integer)session.getAttribute("i"); 
		String sesIinitialize = request.getParameter("sesIinitialize");
		String stepsCompleted = request.getParameter("step_completed");
		String toAddSubmitButton = request.getParameter("to_add_submit_button");
		
		QuizeGameDAOImpl quizGameDAO = new QuizeGameDAOImpl();
		QuizGameDataAnalysisImpl service = new QuizGameDataAnalysisImpl();
		//int firstStepCompletedCounter = 0;
		
		String correctAns = request.getParameter("correctAns");
		String selectedOption = request.getParameter("a");
		Map<Integer,String> qAnsMap = (Map<Integer, String>) session.getAttribute("qAnsMap");
		
		System.out.println("seI BEFORE timeCounter ::"+sesI);
		
		//calculate time first time  of step
		if((request.getParameter("timeCounter") == null) || ( sesI == 6) || (sesI == 11) || (sesI == 16))  {
			System.out.println("seI INSIDE timeCounter ::"+sesI);

			String stepInTime = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(Calendar.getInstance().getTime());
			System.out.println("stepInTime :: "+stepInTime);
			
			session.setAttribute("stepInTime", stepInTime);
		}
		
		//if action is admin then execute 
		if(action.equalsIgnoreCase("admin")) {
			
			//read the selected value from Form 
			String quest = request.getParameter("quest").toString();
			String QA = request.getParameter("QA").toString();
			String QB = request.getParameter("QB").toString();
			String QC = request.getParameter("QC").toString();
			String QD = request.getParameter("QD").toString();
			//String correctAns = request.getParameter("correctAns").toString();
			
			//stored  Question and it's answer to DB 
			QuizeGameQuestionAnswerBO quizeBO = new QuizeGameQuestionAnswerBO();
			quizeBO.setQuestionName(quest);
			quizeBO.setOptionA(QA);
			quizeBO.setOptionB(QB);
			quizeBO.setOptionC(QC);
			quizeBO.setOptionD(QD);
			quizeBO.setCorrectAnswer(correctAns);
			
			try {
				int count1 = quizGameDAO.insertQuestionAndAnswer(quizeBO);
				System.out.println("count ::  "+count1);
			} catch (Exception e) {	
				e.printStackTrace();
				rd = request.getRequestDispatcher("error.jsp");
				rd.forward(request, response);
			}
			
		}else if(action.equalsIgnoreCase("user")) {//if normal user then exceute this logic
			
			try {
				
				//using this code we can hit database at only once.
				if(dataFetcher <= 0) {
					//fetch all Question and answer from database
					listQuizeGameCreationBO = quizGameDAO.fetchAllQuestionAndAnswer();
					
					//get total count of question 
					count = quizGameDAO.getTotalQuestionCount();
					dataFetcher++;
				}
				
				//if new user login then it will be start from 0
				if(sesIinitialize != null) {
					sesI = 0;
				}
			
				//check user selected option are correct or not
				//put in map object .
				if(correctAns != null) {
					if(selectedOption.equalsIgnoreCase(correctAns)) {
						qAnsMap.put(sesI, "correct");
					}else {
						qAnsMap.put(sesI, "incorrect");
					}
				}
				
				//if one the steps completed then
				if(stepsCompleted != null) {
					if(stepsCompleted.equalsIgnoreCase("step_completed")) {
						
						//if user already played that step (first OR second OR third)
						// and he or she want play once again 
						//then update that steps stats.
						if( (quizGameDAO.isUserAvailble(userName))!= 0) {
							int res = 0;
							//if user already played this step then delete this step Quiz Result.
							if(sesI == 5) {
								String stepInTime = (String)session.getAttribute("stepInTime");
								String stepOutTime = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(Calendar.getInstance().getTime());
								
								service.updateDataAnalysisOfQuizGame(userName, stepInTime, stepOutTime, 5);
								
								res = quizGameDAO.delteUserStatsByUserNameAndSteps(userName, "First_Step");
							}else if(sesI == 10) {
								
								String stepInTime = (String)session.getAttribute("stepInTime");
								String stepOutTime = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(Calendar.getInstance().getTime());
																
								service.updateDataAnalysisOfQuizGame(userName, stepInTime, stepOutTime, 10);
								
								res = quizGameDAO.delteUserStatsByUserNameAndSteps(userName, "Second_Step");
							}else if(sesI == 15) {
								String stepInTime = (String)session.getAttribute("stepInTime");
								String stepOutTime = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(Calendar.getInstance().getTime());
								
								service.updateDataAnalysisOfQuizGame(userName, stepInTime, stepOutTime, 15);
								
								res = quizGameDAO.delteUserStatsByUserNameAndSteps(userName, "Third_Step");
							}
							
							System.out.println("user record deleted by that steps ..!"+res);
							//QuizGameDAO.deleteQiuzGameStatsByUserName(userName);
						}else {
							if(sesI == 5) {
								String stepInTime = (String)session.getAttribute("stepInTime");
								String stepOutTime = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(Calendar.getInstance().getTime());
							
								service.updateDataAnalysisOfQuizGame(userName, stepInTime, stepOutTime, 5);
							}else if(sesI == 10) {
								String stepInTime = (String)session.getAttribute("stepInTime");
								String stepOutTime = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(Calendar.getInstance().getTime());
							
								service.updateDataAnalysisOfQuizGame(userName, stepInTime, stepOutTime, 10);
							}else if(sesI == 15){
								String stepInTime = (String)session.getAttribute("stepInTime");
								String stepOutTime = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(Calendar.getInstance().getTime());
							
								service.updateDataAnalysisOfQuizGame(userName, stepInTime, stepOutTime, 15);
							}
						}
						//use service to update user Quiz stats in DB
						String result = new QuizGameServiceImpl().userQuizeGameResultUpdate(qAnsMap,count,userName);
						
						if(result.equalsIgnoreCase("submit")) {
								System.out.println("successfully result stored..!");
						}
						
						
						//get the result of user (pass or Fail)
						String quizResult = new QuizeGameDAOImpl().getUserResultByUserName(userName);
						System.out.println("quizResult :: "+quizResult);
						
						//take user completed step from service 
						int userCompletedStep = new QuizGameServiceImpl().getUserCompletedStepByUserName(userName);
						
				
						if(quizResult.equals("Fail")) {
							if(userCompletedStep == 1) {
								sesI = 5; // if user fail the initialize from 0
							}else if(userCompletedStep == 2) {
								sesI = 10;
							}else if(userCompletedStep == 3) {
								sesI = 15;
							}else if(userCompletedStep == 0) {
								sesI = 0;//if user not completed any step then initialize with 0
							}
							System.out.println("inside fail");
							
							//request.setAttribute("", arg1);
						}else if(quizResult.equals("pass")){
							if(userCompletedStep == 1) {
								sesI = 5; // if user fail the initialize from 0
							}else if(userCompletedStep == 2) {
								sesI = 10;
							}else if(userCompletedStep == 3) {
								sesI = 15;
							}else if( userCompletedStep == 0) {
								sesI = 0;//if user not completed any step then initialize with 0
							}
						//	sesI =  4;
						}
						//clear map object to store next group of result from beginning
						qAnsMap.clear();
						//keep the result in request scope
						request.setAttribute("quizResult", quizResult);
						
					}
				}
				
				
				//if sesI is equals to count-1 then 
				//pass value countCompleted
				if(toAddSubmitButton != null) {
					if (toAddSubmitButton.equals("to_add_submit_button")) {
						if (sesI == 4) {
							System.out.println("first Step countCompleted ");
							request.setAttribute("stepCompleted", "stepCompleted");
						} else if (sesI == 9) {
							System.out.println("second step countCompleted ");
							request.setAttribute("stepCompleted", "stepCompleted");
						} else if (sesI == 14) {
							System.out.println("third step countCompleted ");
							request.setAttribute("stepCompleted", "stepCompleted");
						}
					}
				}
				if(sesI < count) {
					quizeGameBO = listQuizeGameCreationBO.get(sesI);
					sesI = ++ sesI ;
					session.setAttribute("i", sesI);
				}
				//session.setAttribute("", arg1);
				//keep listQuizeGameCreationBO object in request scope
			
				request.setAttribute("quizeGameBO", quizeGameBO);
				
				//forward response to jsp page
				rd = request.getRequestDispatcher("user_quize_application.jsp");
				rd.forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
				rd = request.getRequestDispatcher("error.jsp");
				rd.forward(request, response);
			}			
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
