package com.gamecreation.controller;

import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gamecreation.dao.DbConnector;
import com.gamecreation.dao.DbOperation;
import com.gamecreation.dao.RegistrationDAO;
import com.gamecreation.fileoperations.Arffgen;
import com.gamecreation.fileoperations.ReadFile;
import com.gamecreation.fileoperations.StopwordRemove;
import com.gamecreation.fileoperations.TrainData;
import com.gamecreation.graphs.BarGraph_acc;
import com.gamecreation.graphs.BarGraph_time;
import com.gamecreation.schedulers.CalculateAcc;
import com.gamecreation.schedulers.OYDS_Sheduling;
import com.gamecreation.schedulers.PESOS_Scheduling;
import com.gamecreation.schedulers.Scheduler;
import com.gamecreation.searchengine.HTMLUtils;
import com.gamecreation.searchengine.LinksExtracter;
import com.gamecreation.searchengine.ReverseSearch;
import com.gamecreation.searchengine.SeedSites;
import com.gamecreation.similarityandranking.SiteRanker;
import com.gamecreation.textfieldop.AutoSuggestor;
import com.gamecreation.textfieldop.Dictionary;
import com.gamecreation.web.Crawler;
import com.gamecreation.web.ListLinks;
import com.google.gson.Gson;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.PriorityQueue;
import java.util.Set;
import java.util.TreeMap;
import java.util.Vector;

@WebServlet("/searchQueryUrl")
public class SearchQueryController extends HttpServlet {
	
	List<String> file = new ArrayList<>();
    public static boolean flag = false;
    public static int flag1 = 0;
    public double t1 = 2.0, t2 = 2.5, t3 = 2.5; 
    public static String tthreshold="";	
    public static  String query="";
    
    
        
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SeedSites ss = new SeedSites();
		ReverseSearch rs = new ReverseSearch();
	    ListLinks ll = new ListLinks();
	    ReadFile rf = new ReadFile();
	    String searchString = new String();
	    SiteRanker sr = new SiteRanker();
	    List<String> linkfrntr = new ArrayList<>();
	    Map<String, List<String>> linksOfLink = new HashMap<>();
	    PriorityQueue<String> HQueue = new PriorityQueue<>();
	    PriorityQueue<String> topHQueue = new PriorityQueue<>();
	    List<String> linkfrontier = new ArrayList<>();
	    Map<Integer, Map<Integer, Double>> mapToFile = new HashMap<>();
	    DbOperation dbo = new DbOperation();
	    StopwordRemove stopRem = null;
	    String sitee="";
	    int thrhld =0;
	    String datasetPath = null;
	    
	    HttpSession session = request.getSession(); 
	    
		System.out.println ("SearchQueryController doGet(-,-) method executed.");
		
		try{
			String action = request.getParameter("action");
			System.out.println("action is : --- > "+action);
			
			if(action.equals("Search")){
				
			   tthreshold= 10+"";
			   String redioButtonValue = request.getParameter("physics");
			   session.setAttribute("redioButtonValue", redioButtonValue);
			   System.out.println(redioButtonValue);
			   query = redioButtonValue;
			   //check the radion button value
			   //if it is sound
			  if(redioButtonValue.equalsIgnoreCase("sound")) {
				   query = redioButtonValue+" physics" ;
			   }else if(redioButtonValue.equalsIgnoreCase("light")){//if it is light
				   query = redioButtonValue+" physics" ;
			   }
			   System.out.println("query :: "+query);
			   //query=request.getParameter("searchkeyword");
			   
			   System.out.println("threshold is:::"+tthreshold);
			   System.out.println("Query is:::"+query);
			   
			   datasetPath = request.getServletContext().getRealPath("/dataset");
			   final File folder = new File(datasetPath);
			   String realPathOfFile = request.getServletContext().getRealPath("/files");
			   
			   stopRem=new StopwordRemove(realPathOfFile);
			   
			   			   
		       linksOfLink.clear();
		       thrhld = Integer.parseInt(tthreshold);
		       long startTime = System.currentTimeMillis();
		                 
		       searchString = query;
		       
		       //removing stopworrd from query (eg. what , where ,?)
		       List<String> words = Arrays.asList(searchString.split("\\s"));
		       System.out.println("words :: "+words);
		       List<String> rem = stopRem.removeStopWords(words,realPathOfFile);
		       System.out.println("rem :: "+rem);
		       
		       searchString = "";
		       
		       for (String string : rem) {
		           searchString += string + " ";
		       }
		      System.out.println(searchString);

		                    
				Integer threshold = Integer.parseInt(tthreshold);
				
				List<String> seedSite = ss.getSeedSites(searchString.trim(), threshold, file,datasetPath);
				System.out.println(seedSite);
				System.out.println("size of links is :: "+seedSite.size());
				
				flag = false;
			
				//if search Query data is not available in Dataset then only
				//this if condition logic will execute
				if (seedSite.isEmpty()) {
					searchString = searchString.trim();
					
					flag = true;
					Crawler obj = new Crawler();
					//sending rquest to google search engine
					System.out.println(" searchString ::"+searchString+" threashHold :: "+thrhld);
					Set<String> result = obj.getDataFromGoogle(searchString, thrhld);
					
					System.out.println("google give result is :: "+result);
					System.out.println("size of result :: "+result.size());
					for (String temp : result) {
						seedSite.add(temp);
					}
					System.out.println(result.size());
			}//if

		
			for (String seedSite1 : seedSite) {
				System.out.println(seedSite1);
			}
			
			TreeMap<String, Double> map = sr.siteSimilarity(seedSite, searchString);
			Set<String> afterRank = map.keySet();
			
			try {               
           	 //adding each link into list Collection object 
				for (String afterRank1 : afterRank) {
					System.out.println(afterRank1);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			
			for (String site : afterRank) {
				sitee += " " + site;//sitee = sitee +" "+site;
				if (site.equals("")) {
					continue;
				}
				List<String> links = new ArrayList<>();

				linksOfLink.put(site, links);
				
			}//for	
			
			//storing seed sites in request scope
			sitee = sitee.trim();//removing first and last space
			System.out.println("sitee :: "+sitee);
			request.setAttribute("site", sitee.split(" "));
				
			//storing deep sites in request scope
			System.out.println(linksOfLink);
			
			rs.setLinksOfLink(linksOfLink);
			
			long endTime = System.currentTimeMillis();
			long duration = (endTime - startTime);

		}//if
			//storing  object in session scope to aaccess all over application
			session.setAttribute("datasetPath", datasetPath);
			session.setAttribute("reversSearch", rs);
			session.setAttribute("searchString", query);
			session.setAttribute("flag", flag);
			session.setAttribute("topHQueue",topHQueue);
			session.setAttribute("linkfrontier",linkfrontier);
			session.setAttribute("mapToFile",mapToFile);
			session.setAttribute("t1",t1);
			session.setAttribute("rf",rf);
			session.setAttribute("HQueue",HQueue);
			session.setAttribute("sr",sr);
			session.setAttribute("linkfrntr",linkfrntr);
			session.setAttribute("tthreshold", tthreshold);
			
			session.setAttribute("onlineLearned", "Yes");
			
			System.out.println("site :: "+sitee);
			request.getSession().setAttribute("sitee", sitee);
			
			//forwarding request to jsp page
			RequestDispatcher rd = request.getRequestDispatcher("searchQuery.jsp");
		try {
				rd.forward(request, response);
				
			} catch (ServletException | IOException e) {
				e.printStackTrace();
				request.getRequestDispatcher("error.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				request.getRequestDispatcher("error.jsp").forward(request, response);
		}//inner try catch
		}catch (Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}//outer try catch

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
