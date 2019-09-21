package com.gamecreation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gamecreation.service.UserSessionTrackServiceImpl;
import com.gamecreation.vo.UserSessionTrackVO;


@WebServlet("/logoutUrl")
public class LogoutController extends HttpServlet {
	

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		UserSessionTrackVO userVO = new UserSessionTrackVO();
		HttpSession session = request.getSession(false); //Fetch session object
		RequestDispatcher rd = null;
		
		//if login successful then start the time 
		String logOutTime = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String onlineLearned= (String) session.getAttribute("onlineLearned");
		if(onlineLearned == null) {
			onlineLearned = "no";
		}
		
		userVO.setUserName((String)session.getAttribute("userName"));
		userVO.setLoginTime((String)session.getAttribute("loginTime"));
		userVO.setLogoutTime(logOutTime);
		userVO.setOnlineLearned(onlineLearned);
		System.out.println(session.getAttribute("userName"));
		try {
			String userSessionTrack = new UserSessionTrackServiceImpl().saveSessionTrack(userVO);
			System.out.println(userSessionTrack);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/GameCreationForSearchQuery/error.jsp");
		}
		 //If session is not null
		 if(session!=null){
			 
			 session.invalidate(); //removes all session attributes bound to the session
			 //request.setAttribute("errMessage", "You have logged out successfully");
			
			 RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
			 requestDispatcher.forward(request, response);
		 	 System.out.println("Logged out");
		 }
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
