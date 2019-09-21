package com.gamecreation.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamecreation.bo.QuizeGameQuestionAnswerBO;
import com.gamecreation.dao.QuizeGameDAOImpl;


@WebServlet("/adminQuizUrl")
public class AdminQuizeGameController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String action = request.getParameter("action");
		String correctAns = request.getParameter("correctAns");
		RequestDispatcher rd = null;
		QuizeGameDAOImpl QuizGameDAO = new QuizeGameDAOImpl();
	//	if(action.equalsIgnoreCase("admin")) {
			
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
				int count1 = QuizGameDAO.insertQuestionAndAnswer(quizeBO);
				System.out.println("count ::  "+count1);
			} catch (Exception e) {	
				e.printStackTrace();
				rd = request.getRequestDispatcher("error.jsp");
				rd.forward(request, response);
			}
			
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
