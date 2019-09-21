package com.gamecreation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.PriorityQueue;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.awt.Color;
import java.awt.Cursor;
import java.awt.Dimension;
import java.awt.Font;
import static java.awt.Frame.MAXIMIZED_BOTH;
import java.awt.GridBagLayout;
import java.awt.Window;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
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
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JProgressBar;
import javax.swing.SwingUtilities;
import javax.swing.SwingWorker;
import javax.swing.UIManager;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.table.DefaultTableModel;
import javax.swing.text.AbstractDocument;
import javax.swing.text.AttributeSet;
import javax.swing.text.BadLocationException;
import javax.swing.text.DocumentFilter;

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
import com.gamecreation.service.MapSortedByValues;
import com.gamecreation.similarityandranking.SiteRanker;
import com.gamecreation.textfieldop.AutoSuggestor;
import com.gamecreation.textfieldop.Dictionary;
import com.gamecreation.web.Crawler;
import com.gamecreation.web.ListLinks;
/**
 * Servlet implementation class SiteRankerController
 */
@WebServlet("/siteRankerUrl")
public class SiteRankerController extends HttpServlet {
	
    static boolean flag = false;
    public static final String COMMIT_ACTION = "commit";
  
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  ListLinks ll = new ListLinks();
		    String searchString = new String();
		    SiteRanker sr = new SiteRanker();
		    List<String> linkfrntr = null;
		    List<String> formfrontier = new ArrayList<>();
		    PriorityQueue<String> searchableForms = new PriorityQueue<>();
		    Set<String> linkList = new HashSet<>();
		    Set<String> sett = new HashSet<>();
		   	    
			response.setContentType("text/html");
			System.out.println("SiteRankerController class doGet(-,-)");
			
			linkfrntr=(ArrayList<String>)request.getSession().getAttribute("linkfrntr");
			flag=(boolean)request.getSession().getAttribute("flag");
			searchString=(String)request.getSession().getAttribute("searchString");
			
			System.out.println("Flag :: "+flag);
			System.out.println(linkfrntr);
			
			try {
				String action = request.getParameter("action");
				System.out.println("action is : --- > " + action);
				
				if (action.equals("Ranker")) {
					try {
						StringBuilder sb = new StringBuilder();

						Map<String, Set<String>> frmMap = new HashMap<>();
						for (String linkfrntr1 : linkfrntr) {
							Set<String> frm = new HashSet<>();
							try {
								List<String> links = null;
								if (flag == true) {
									links = ll.getWebpageLinks(linkfrntr1,
											Integer.parseInt(SearchQueryController.tthreshold));
								} else {
									links = LinksExtracter.extractLinks(linkfrntr1);
								}
								System.out.println("links :: "+links);
								for (String extractLink : links) {
									String relLink = extractLink;
									relLink = relLink.replace("../", "");
								if (relLink.contains(".htm")) {
										System.out.println("------>>> " + relLink);
										if (!relLink.toLowerCase().contains("javascript")) {
											frm.add(relLink);
										}
									}
								}
								System.out.println("Form :: "+frm);
								frmMap.put(linkfrntr1, frm);
								System.out.println("");
							} catch (IOException ex) {
								ex.printStackTrace();
							}
							catch(Exception e) {
								e.printStackTrace();
							}
						}

						if (flag == true) {
							for (Map.Entry<String, Set<String>> entrySet : frmMap.entrySet()) {
								String key = entrySet.getKey();
								Set<String> value = entrySet.getValue();
								System.out.println(key + "==>>");
								for (String value1 : value) {
									System.out.println("value is ::"+value1);
									linkList.add(value1);
								}
							}
						} else {
							for (Map.Entry<String, Set<String>> entrySet : frmMap.entrySet()) {
								String key = entrySet.getKey();
								Set<String> value = entrySet.getValue();
								for (String value1 : value) {
									String str = key.replace(System.getProperty("user.dir"), "");
									str = str.substring(0, str.lastIndexOf(File.separator));
									//String res = System.getProperty("user.dir") + str + File.separator + value1;
									String res =  str + File.separator + value1;
									System.out.println("res ::"+res);
									linkList.add(res);
								}
							}
						}

						searchableForms.addAll(linkList);
						formfrontier.addAll(searchableForms);

						TreeMap<String, Double> map = sr.siteSimilarity(formfrontier, searchString);
					
						Set<String> keySet = map.keySet();
					
						List<String> keys = new ArrayList<>(keySet);
						
						Collection<Double> values = map.values();
						
						List<Double> similarities = new ArrayList<>(values);
						
						
						//Map<String,Double> strMap=new TreeMap<String, Double>();
						
						for (int i = 0; i < keySet.size(); i++) {
							String keyval = keys.get(i);
							Double val = similarities.get(i);
							//strMap.put(keyval, val);
							// model.addRow(new Object[]{keyval, val});
							try {
								sb.append(keyval).append("\t").append(val).append("\n");
								String text;
								if (flag == true) {
									text = HTMLUtils.extractWebText(keyval);
								} else {
									text = HTMLUtils.extractText(keyval);
								}
								System.out.println(text);
								if (!text.equals("")) {
									sett.add(keyval);
								}

							} catch (Exception ex) {
									ex.printStackTrace();
							}
						}
						System.out.println(" sbString :: "+sb.toString());
						String strM =  sb.toString();
						System.out.println("str M new ::"+strM);
						
						
						String[] strMsplits = strM.split("\\s+");
						Map<String,String> strMap=new TreeMap<String, String>();
						for(int i=0;i<strMsplits.length;i++) {
							strMap.put(strMsplits[i++], strMsplits[i]);
						}
						
						// Calling the method sortByvalues		
					    Map sortedMap = MapSortedByValues.sortByValues(strMap);
						System.out.println("strMap new  :: "+sortedMap);
						request.setAttribute("keyMap", sortedMap);

					} catch (Exception e) {
						e.printStackTrace();
					}

					RequestDispatcher rd = request.getRequestDispatcher("siteRanker.jsp");
					try {
						rd.forward(request, response);
					} catch (ServletException | IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						request.getRequestDispatcher("error.jsp").forward(request, response);
					}

				}
			} catch (Exception e) {
				e.printStackTrace();
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}

	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}//class
