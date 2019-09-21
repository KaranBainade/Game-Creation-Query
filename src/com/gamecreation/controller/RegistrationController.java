package com.gamecreation.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamecreation.dao.RegistrationDAO;
import com.gamecreation.vo.RegisterVO;


@WebServlet("/registerationUrl")
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("RegistrationController doGet(-,-) method ");
		
		try{
			String action = request.getParameter("action");
			System.out.println("action is : --- > "+action);

			if(action.equals("register")){
				RegisterVO vo = new RegisterVO();
				
				vo.setSelectedUser(request.getParameter("SelectUser"));	
				vo.setName(request.getParameter("name"));	
				vo.setEmail(request.getParameter("email"));
				vo.setContact(request.getParameter("contact"));
				vo.setDOB(request.getParameter("DOB"));
				vo.setUsername(request.getParameter("uname"));
				vo.setPassword(request.getParameter("password"));
				vo.setAddress(request.getParameter("address"));
			  
				if(new RegistrationDAO().registration(vo)){
					response.sendRedirect("/GameCreationForSearchQuery/login.jsp");
				}else {
					response.sendRedirect("/GameCreationForSearchQuery/error.jsp");
				}
			}		
		}catch(Exception e){
			e.printStackTrace();
			response.sendRedirect("/GameCreationForSearchQuery/error.jsp");
		}
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}


}//classs
