package com.gamecreation.controller;

import java.io.IOException;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamecreation.pdfformator.PDFSplittter;
import com.gamecreation.pdfformator.ResizeImage;
import com.gamecreation.service.GoogleRes;


@WebServlet("/pdfGanerateUrl")
public class PdfGenratorController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String deepWebSiteUrl = request.getParameter("action");
		System.out.println("deep website url is  :: "+request.getParameter("action"));
		String pdfFolderPath =  request.getServletContext().getRealPath("/pdf");
		String imagePath     = request.getServletContext().getRealPath("/images");
		System.out.println(" pdfFolderPath is :: "+pdfFolderPath);
		
		try {
				//TreeMap<String, String> mapRank =(TreeMap<String, String>)request.getSession().getAttribute("mapRank");
				//it iterate first key from map as first link
				//String firstLink = mapRank.entrySet().iterator().next().getKey();
				System.out.println("deep website url is :: "+deepWebSiteUrl);
				
				// link  data  will extracted  into pdf format 
				GoogleRes.convertWebpageIntoPDF(deepWebSiteUrl, pdfFolderPath);
				System.out.println("text is stored in pdf file ");
				
				// stored each pdf docs as images
				int imgCount = new PDFSplittter().splitPdfFile(pdfFolderPath, imagePath);
				System.out.println("image count ::"+imgCount);
				//resizing images
				new ResizeImage().resizeImages(imagePath,imgCount);
				
				//check user alread read or not 
				
				
				//forwarding request to html resource
				//request.getRequestDispatcher("pdfViewerWithQAPane.jsp").forward(request,response);
				request.getRequestDispatcher("pdfViewer.jsp").forward(request,response);	
		}catch(Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("error.jsp").forward(request,response);
		}
	}//doPost(-,-)

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}




}
