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
import com.gamecreation.dao.UserDaoImpl;
import com.gamecreation.service.GamePageService;

@WebServlet("/puzzleGameUrl")
public class PuzzleGameController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String imageFolderPath = request.getServletContext().getRealPath("/images");
		int totalImgCount = 0;
		String userName = null;
		
		System.out.println("in PuzzleGameController controller..!");
		
		///String commentTextArea = request.getParameter("commentTextArea");
		String stepCount       = request.getParameter("stepCount");
		String timeCount       = request.getParameter("timeCount");
		String      modeValue     = request.getParameter("modeValue");
		//int modeValue          = (int)session.getAttribute("modeValue");
		//String userName 	   = (String) session.getAttribute("userName");
      
		//System.out.println("comment :: "+commentTextArea);
		System.out.println("step Count is :: "+stepCount);
		System.out.println("time count is :: "+timeCount);
		System.out.println("mode value is :: "+modeValue);
		//System.out.println("userName value is :: "+userName);
		
		
		try {
			// get total number of image present in images folder
			// dynamically
			totalImgCount = new GamePageService().getTotalImages(imageFolderPath);
			// put this totalImgCount local varible in request scope to access to next
			// page(i.e jsp )
			request.setAttribute("totalImgCount", totalImgCount);

			// get userName from session scope
			userName = (String) session.getAttribute("userName");

			//checking whether user already played puzzle game or not
			//if condition true means user is already played game played puzzle game
			if (new UserDaoImpl().checkUserIsAvailable(userName)) {
				
				//check the game mode he played 
				//fetch user mode value 
				int mode_value = new PuzzleGameDAOImpl().getUserModeValueByUserName(userName);
				if(mode_value == 0) {
					session.setAttribute("session_modeValue", 0);
				}else if (mode_value == 3) {
					session.setAttribute("session_modeValue", 3);// set modeValue to 4 (means medium)
				} else if (mode_value == 4) {
					session.setAttribute("session_modeValue", 4);// set modeValue to 5 (means hard)
				}else {
					session.setAttribute("session_modeValue", 5);
				}
				
			}else {//user is not played yet game insert user record
				
				PuzzleGameUserBO userBO = new PuzzleGameUserBO();
				userBO.setUserName(userName);
				userBO.setModeValue(0);//defualt mode is 3 means (normal)
				userBO.setSteps((0));
				userBO.setTime((0));
				//userBO.setComment("");
				
				
				//insert user record mode wise 
				new PuzzleGameDAOImpl().insertUserData(userBO);
				
				session.setAttribute("session_modeValue", 0);
			}
			
			//
			// forward request to gametest.jsp page
			request.getRequestDispatcher("/puzzle_game.jsp").forward(request, response);

		} catch (Exception e) {
			// if exception occure then forwrd to error.jsp page
			e.printStackTrace();
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
