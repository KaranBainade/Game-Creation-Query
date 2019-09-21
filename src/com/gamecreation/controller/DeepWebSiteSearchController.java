package com.gamecreation.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.PriorityQueue;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gamecreation.fileoperations.ReadFile;
import com.gamecreation.searchengine.ReverseSearch;
import com.gamecreation.similarityandranking.SiteRanker;
import com.gamecreation.web.DeepWebsiteListLinks;

@WebServlet("/deepWebSiteUrl")
public class DeepWebSiteSearchController extends HttpServlet {
	
	@Override
	public void init() throws ServletException {
		
		//get counter of how many time he learned from DB
		
		
		super.init();
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> linkss = new ArrayList<>();
		
		Map<String, List<String>> frontier = null;
		ReverseSearch rs = null;
		PriorityQueue<String> HQueue = new PriorityQueue<>();
		PriorityQueue<String> LQueue = new PriorityQueue<>();
		PriorityQueue<String> topHQueue = null;
		Map<Integer, Map<Integer, Double>> mapToFile = null;
		String searchString =null;
		SiteRanker sr = new SiteRanker();
		ReadFile rf = new ReadFile();
		List<String> linkfrontier = null;
		List<String> linkfrntr = null;
		boolean flag = false;
		DeepWebsiteListLinks ll = new DeepWebsiteListLinks();		
		int thrhld = 0;
		String datasetPath = null;
		String linksss = "";
		
		response.setContentType("text/html");
		
		System.out.println ("doGet of DeepWebSiteController..!");
		System.out.println("seed link is ==> "+request.getParameter("seedLink"));
		String seedLink= request.getParameter("seedLink");
		//get session scope object 
		HttpSession session = request.getSession();
		//reading session scope object values
		rs=(ReverseSearch) session.getAttribute("reversSearch");
		searchString=(String)session.getAttribute("searchString");
		flag=(boolean)session.getAttribute("flag");
		topHQueue=(PriorityQueue<String>)session.getAttribute("topHQueue");
		linkfrontier=(ArrayList)session.getAttribute("linkfrontier");
		mapToFile=(HashMap<Integer, Map<Integer,Double>>)session.getAttribute("mapToFile");
		//t1=(double)session.getAttribute("t1");
		rf=(ReadFile)session.getAttribute("rf");
		//this.HQueue=(PriorityQueue)session.getAttribute("HQueue");
		sr=(SiteRanker)session.getAttribute("sr");
		linkfrntr=(ArrayList)session.getAttribute("linkfrntr");
		thrhld=Integer.parseInt((String) session.getAttribute("tthreshold"));
		datasetPath = (String)session.getAttribute("datasetPath");
		
		//String seedSite = (String) request.getAttribute("sitee");
		//System.out.println("sitee ::" +seedSite);
	//	String str = lbl.getText();
		String searchString1 = searchString;
		System.out.println("search Query is :: "+searchString1);
		String redioButtonValue = (String)session.getAttribute("redioButtonValue");
		System.out.println("redioButtonValue:: "+redioButtonValue);
		
		String site = seedLink;
		
		if (flag == true) {
			linkss = ll.getWebpageLinks(site, thrhld,redioButtonValue);
		} else {
			linkss = rs.getLinks(searchString1.trim(), site,datasetPath);
		}
		
		System.out.println("links is :: "+linkss);
		for (String link : linkss) {
			linksss += " " + link;
		}
		
		linksss = linksss.trim();//removing first and last space
		
		System.out.println("links :: "+linksss);
		request.setAttribute("deep", linksss.split(" "));
		
		String seedSite = (String) session.getAttribute("sitee");
		System.out.println("sitee ::" +seedSite);
		request.setAttribute("seedSite2", seedSite.split(" "));
		
		RequestDispatcher rd = request.getRequestDispatcher("deepWebSiteResult.jsp");
		
		try {
				rd.forward(request, response);
			} catch (ServletException | IOException e) {
				request.getRequestDispatcher("error.jsp").forward(request, response);
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
