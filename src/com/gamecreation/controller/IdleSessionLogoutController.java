package com.gamecreation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamecreation.dao.IdleSessionLogoutDAOImpl;


@WebServlet("/idleSessionLogoutUrl")
public class IdleSessionLogoutController extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IdleSessionLogoutDAOImpl dao = new IdleSessionLogoutDAOImpl();
		
		String userName = (String)request.getSession().getAttribute("username");
		String pageNameWhereSessionInActivate =  request.getParameter("page");
		String timeWhenSessionInActivate =request.getParameter("date");
		
		//use dao
		try {
			int count = dao.storeSessionUserData(userName, pageNameWhereSessionInActivate, timeWhenSessionInActivate);
			
			if(count != 0 ) {
				System.out.println("data is inserted..!");
			}else {
				System.out.println("data is not inserted...!");
			}
				
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/GameCreationForSearchQuery/error.jsp");
		}
		
		System.out.println("page name is :: "+request.getParameter("page"));
		System.out.println("date and time  is :: "+request.getParameter("date"));
		
		
		response.sendRedirect("/GameCreationForSearchQuery/login.jsp");
		//request.getRequestDispatcher("login.jsp").forward(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
