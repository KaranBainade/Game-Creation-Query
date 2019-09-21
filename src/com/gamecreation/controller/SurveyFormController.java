package com.gamecreation.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamecreation.bo.SurveyFormBO;
import com.gamecreation.dao.SurveyFormDAO;


@WebServlet("/surveyFormUrl")
public class SurveyFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//read all form data from survey form
		String userName        = request.getParameter("name");
		String email           = request.getParameter("email");
		int age                = Integer.parseInt(request.getParameter("age"));
		String currentPosition = request.getParameter("currentPosition");
		String userRating      = request.getParameter("userRating");
		String[] preference    = request.getParameterValues("preference");//it will get value that selected by end user 
		String comment         = request.getParameter("comments");
		String prefrerenceResult = "";
		
		
		SurveyFormBO   bo = new SurveyFormBO();
		
		for(String chkBoxVal : preference) {
			prefrerenceResult = prefrerenceResult+chkBoxVal+",";
		}
		
		//removing last charecter from string (i.e  comma(,))
		prefrerenceResult = prefrerenceResult.substring(0, prefrerenceResult.length() - 1);
		
		//adding all varible inside BO class instance
		bo.setUserName(userName);
		bo.setEmail(email);
		bo.setAge(age);
		bo.setCurrentRole(currentPosition);
		bo.setRecommendFried(userRating);
		bo.setImprovement(prefrerenceResult);
		bo.setComment(comment);
		
		
		try {
			//use DAO
			int count = new SurveyFormDAO().storeSurveyFormData(bo);
			
			if(count > 0) {
				System.out.println("data is inserted..!");
				//after survey successfully inserted then forward request to Homepage
				request.getRequestDispatcher("/dashboardUrl").forward(request, response);;
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
