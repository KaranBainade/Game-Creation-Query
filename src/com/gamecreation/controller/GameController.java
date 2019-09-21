package com.gamecreation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamecreation.dao.PuzzleGameDAOImpl;
import com.gamecreation.dao.QuizeGameDAOImpl;
import com.gamecreation.service.OnlineLearnedAnalysisService;


@WebServlet("/gameUrl")
public class GameController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//read total time spended on learning 
		//System.out.println(" timeSpended  value :: "+request.getSession().getAttribute("hidden1"));
				
		System.out.println("timeSpended "+request.getParameter("timeSpended"));
		
		String userName = (String)request.getSession().getAttribute("userName");
		System.out.println("user Name "+userName);
		System.out.println("request Parameter "+request.getParameter("action"));
		
		//if user want play once again then puzzle game
		if (request.getParameter("action") != null) {
			if (request.getParameter("action").equalsIgnoreCase("playOnceAgainPuzzleGame")) {
				try {
					// delete the all the stats of user puzzle game
					int count = new PuzzleGameDAOImpl().deletePuzzlGameStatsByUser(userName);
					System.out.println("delete user count :: " + count);
					
				} catch (Exception e) {
					e.printStackTrace();
					request.getRequestDispatcher("/error.jsp").forward(request, response);
				}

			}
		}
		
		if(request.getParameter("action") != null) {
			//if user want play once again then Quiz game
			if (request.getParameter("action").equalsIgnoreCase("playOnceAgainQuizGame")) {
				try {					
					//delete the all the stats of user Quiz Game
					System.out.println("in side ....!");
					int count = new QuizeGameDAOImpl().deleteQiuzGameStatsByUserName(userName);
					request.getSession().setAttribute("i", 0);
					
					System.out.println("delete user count of Quiz Game :: " + count);
					
				} catch (Exception e) {
					e.printStackTrace();
					request.getRequestDispatcher("/error.jsp").forward(request, response);
				}
			}
		}
		
		if(request.getParameter("timeSpended") != null) {
			
			OnlineLearnedAnalysisService service = new OnlineLearnedAnalysisService();
			String timeSpended = request.getParameter("timeSpended");
			
			try {
				
				service.doDataAnalysisOfOnlineLearning(userName, timeSpended);
				
			} catch (Exception e) {
				e.printStackTrace();
				request.getRequestDispatcher("/error.jsp").forward(request, response);
			}
		}
		
		request.getRequestDispatcher("game.jsp").forward(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
