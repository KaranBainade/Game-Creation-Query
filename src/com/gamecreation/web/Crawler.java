package com.gamecreation.web;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawler {

    private static Pattern patternDomainName;
    private Matcher matcher;
    private static final String DOMAIN_NAME_PATTERN
            = "([a-zA-Z0-9]([a-zA-Z0-9\\-]{0,61}[a-zA-Z0-9])?\\.)+[a-zA-Z]{2,6}";

    static {
        patternDomainName = Pattern.compile(DOMAIN_NAME_PATTERN);
    }



    public String getDomainName(String url) {

        String domainName = "";
        matcher = patternDomainName.matcher(url);
        if (matcher.find()) {
            domainName = matcher.group(0).toLowerCase().trim();
        }
        return domainName;
    }

    public Set<String> getDataFromGoogle(String query, int thold) {

        Set<String> result = new HashSet<String>();
        Set<String> fin = new HashSet<>();
        
        query = query.trim();
        
        String request = "https://www.google.com/search?q="+query+"&num="+1000;
        String request1 = "https://www.bing.com/search?q="+query+"&num="+1000;  
  
        try {
            // need http protocol, set this as a Google bot agent :) 
            Document doc = Jsoup.connect(request1).timeout(60000).userAgent("Mozilla/5.0 (Windows; U; WindowsNT 5.1; en-US; rv1.8.1.6) Gecko/20070725 Firefox/2.0.0.6").get();
        	//Thread.sleep(30000);
        	//Document doc = Jsoup.connect(request).timeout(60000).userAgent("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.38 Safari/537.36").get();
        	
            // get all links of url
            Elements links = doc.select("a[href]");
            System.out.println("links size is :: "+links.size());
            
           // System.out.println("links :: "+links);
   
            for (Element link : links) {
                String temp = link.attr("href");
                System.out.println("temp ::"+temp);
               
                
//                if (temp.startsWith("/url?q=")) 
                //use regex to get domain name
                String domainName = getDomainName(temp);
                
                System.out.println("domain ::"+domainName);
                String[] que = query.split("\\s");
                
                System.out.println(Arrays.toString(que));
                
               
                           
                for ( String string : que ) {
                    if ( temp.contains(string) ) {
                    	 //result.add(domainName);
                    	if( !domainName.isEmpty() ) {
                    		 //checking whether domain name is existed or not
                    		InetAddress domainInetAddress = null;
                            try {
                            	
                                domainInetAddress = InetAddress.getByName(domainName);
                                System.out.println("Somebody had taken the domain: " + domainName);
                                System.out.println("Domain information: ");
                                System.out.println(domainInetAddress);
                                //if domain are existed then only adding to set collection 
                                result.add(domainName);
                            } catch (UnknownHostException uhe) {
                            	continue;
                               // System.out.println("Congratulations! No host information can be found for domain: " + domainName);
                                //System.out.println("There may be a possibility that " + domainName + " is still available for registration. ");
                            }
                        	
                    	}
                    }
                }

            }
            int cnt = 0;
           System.out.println("result :: "+result);
           System.out.println("size of result :: "+result.size()); 
            for (String string : result) {
            	System.out.println(" "+string);
            	//*if(!string.startsWith("")) {
            		
            	//}
            	
            	if (thold == cnt) {
                    break;
                }
            	fin.add(string);
                cnt++;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }catch(Exception e) {
        	e.printStackTrace();
        }
        return fin;
    }
    
    public static void main(String[] args) {

      Crawler obj = new Crawler();
        Set<String> result = obj.getDataFromGoogle("sound", 10);
        for (String temp : result) {
            System.out.println(temp);
        }
        System.out.println(result.size());
    
    	
    /*	String domainToCheck = "www.paddypower.com";
       
        InetAddress domainInetAddress = null;
 
        try {
            domainInetAddress = InetAddress.getByName(domainToCheck);
 
            System.out.println("Somebody had taken the domain: " + domainToCheck);
            System.out.println("Domain information: ");
            System.out.println(domainInetAddress);
        } catch (UnknownHostException uhe) {
            System.out.println("Congratulations! No host information can be found for domain: " + domainToCheck);
            System.out.println("There may be a possibility that " + domainToCheck + " is still available for registration. ");
        }
 */
    }
 
}
