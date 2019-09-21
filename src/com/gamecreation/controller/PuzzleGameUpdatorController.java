package com.gamecreation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gamecreation.bo.PuzzleGameUserBO;
import com.gamecreation.dao.PuzzleGameDAOImpl;
import com.gamecreation.service.PuzzleGameDataAnalysisImpl;


@WebServlet("/puzzleGameUpdatorUrl")
public class PuzzleGameUpdatorController extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int totalImgCount = 0;
		String userName = null;
		PuzzleGameDAOImpl puzzleGameDAO = new PuzzleGameDAOImpl();
		System.out.println("in PuzzleGameUpdatorController controller..!");
		PuzzleGameDataAnalysisImpl service = new PuzzleGameDataAnalysisImpl();
		
		///String commentTextArea = request.getParameter("commentTextArea");
		
		//int modeValue          = (int)session.getAttribute("modeValue");
		//String userName 	   = (String) session.getAttribute("userName");
      
		//System.out.println("comment :: "+commentTextArea);

		//System.out.println("userName value is :: "+userName);
		//convert string into int 
		
		
		try {
			if(request.getParameter("stepCount") != null) {
				int stepCount       = Integer.parseInt(request.getParameter("stepCount"));
				int timeCount       = Integer.parseInt(request.getParameter("timeCount"));
				int modeValue       = Integer.parseInt(request.getParameter("modeValue"));
				userName = (String) session.getAttribute("userName");
			
				System.out.println("step Count is :: "+stepCount);
				System.out.println("time count is :: "+timeCount);
				System.out.println("mode value is :: "+modeValue);
				System.out.println("user name :: "+userName );
				
				//update puzzle data to analyesis
				service.doDataAnalysisOfPuzzleGame(timeCount, modeValue, userName);
				
				//get user mode value 
				int modeVal = puzzleGameDAO.getUserModeValueByUserName(userName);
				
				//if modeVal is already in DB then update it..
				if(modeVal==modeValue) {
					//update user puzzle game states mode wise
					puzzleGameDAO.updatePuzzleGameStatesByUserName(userName, stepCount, timeCount, modeValue);
				}else {
					PuzzleGameUserBO userBO = new PuzzleGameUserBO();
					userBO.setUserName(userName);
					userBO.setModeValue(modeValue);//defualt mode is 3 means (normal)
					userBO.setSteps(stepCount);
					userBO.setTime(timeCount);
					
					//insert user puzzle game stats mode wise
					puzzleGameDAO.insertUserData(userBO);
				
				}
				
			}
				//forward request and response to GameController
				request.getRequestDispatcher("/gameUrl").forward(request, response);
			
		}catch(Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
