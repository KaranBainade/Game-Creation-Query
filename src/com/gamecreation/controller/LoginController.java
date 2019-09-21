package com.gamecreation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gamecreation.dao.LoginDAO;

@WebServlet("/loginUrl")
public class LoginController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	public static String username="";
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession();
		RequestDispatcher rd = null;
		
		
		System.out.println("session :: "+session.getId());
		
		try {
			String action = request.getParameter("action");
			System.out.println("action is : --- > " + action);

			if (action.equals("login")) {
				
				String selectedUser = request.getParameter("SelectedUser");
				username = request.getParameter("username");
				String password = request.getParameter("password");
				
				//place both user and password in sessions scope
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				
				//putting i varible in session scope to access Question from
				//0 to login user
				int i = 0;
				session.setAttribute("i", i);
				
				//puttung Map object in sessions scope to store 
				//result of user.
				Map<Integer,String> qAnsMap = new HashMap();
				session.setAttribute("qAnsMap", qAnsMap);
				
 				System.out.println("i value :: "+session.getAttribute("i"));
 				
				
				if (new LoginDAO().loginUser(username, password)) {
					
					//if login successful then start the time 
					String loginTime = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(Calendar.getInstance().getTime());
					session.setAttribute("loginTime", loginTime);
					
					//forward the request to dashboard Url
					rd = request.getRequestDispatcher("/dashboardUrl");
					rd.forward(request, response);
					
				} else {
					System.out.println("in else block");
					pw.println("<script type=\"text/javascript\">");
					pw.println("alert('Failed to Login');");
					pw.println("location='/GameCreationForSearchQuery/login.jsp';");
					pw.println("</script>");
			
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/GameCreationForSearchQuery/error.jsp");
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	
}
