/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gamecreation.web;

import java.util.ArrayList;
import java.util.List;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 * Example program to list links from a URL.
 */
public class DeepWebsiteListLinks {

    public List<String> getWebpageLinks (String str, int thrhld,String radionButtoName) {
        List<String> linksoflink = new ArrayList<>();
        
        String upperCaseradionButtoName = radionButtoName.toUpperCase();
        String lowerCaseradionButtoName = radionButtoName.toLowerCase();
        
        String firstCharacterUpperCaseradionButtoName = radionButtoName.substring(0, 1).toUpperCase() + radionButtoName.substring(1);//to genrate first character as capital of string
        
        System.out.println(upperCaseradionButtoName + " "+lowerCaseradionButtoName+" "+firstCharacterUpperCaseradionButtoName);
        
        try {
            String url = new String();
            if (!str.contains("http")) {
                url = "http://" + str;
                System.out.println("URL :: "+url);
            } else {
                url = str;
            }
            
            if(url.equalsIgnoreCase("http://en.wikipedia.org")) {
            	url = url+"/wiki/"+radionButtoName;
            	linksoflink.add(url);
            }
            
            if(url.equalsIgnoreCase("http://www.bing.com")) {
            	url = url+"/search?q=physics-"+radionButtoName;
            }
            
            if(url.equalsIgnoreCase("www.tutorialspoint.com")) {
            	url = url+"//physics_part1/"+radionButtoName;
            }
            
            if(url.equalsIgnoreCase("http://www.tutorialspoint.com")) {
            	url = url+"/physics_part1";
            }
            System.out.println(url);
            print("Fetching %s...", url);
            
            Document doc = null;
            Elements links =  null;
            
            //synchronized (this) {
            	//fetching all HTML code of Website page url
            	  doc = Jsoup.connect(url)
            			  .timeout(60000)
            			 .userAgent("Mozilla/5.0 (Windows; U; WindowsNT 5.1; en-US; rv1.8.1.6) Gecko/20070725 Firefox/2.0.0.6")
            			  .get();
            	  //fetching <a> tag code data from doc object(that already have all the HTML Code)
            	  links = doc.select("a[href]");
            	  System.out.println(links);
			//}
            //Document doc = Jsoup.connect(url).get();
      //      Elements links = doc.select("a[href]");
//            Elements media = doc.select("[src]");
//            Elements imports = doc.select("link[href]");
//
//            print("\nMedia: (%d)", media.size());
//            for (Element src : media) {
//                if (src.tagName().equals("img")) {
//                    print(" * %s: <%s> %sx%s (%s)",
//                            src.tagName(), src.attr("abs:src"), src.attr("width"), src.attr("height"),
//                            trim(src.attr("alt"), 20));
//                } else {
//                    print(" * %s: <%s>", src.tagName(), src.attr("abs:src"));
//                }
//            }
//
//            print("\nImports: (%d)", imports.size());
//            for (Element link : imports) {
//                print(" * %s <%s> (%s)", link.tagName(), link.attr("abs:href"), link.attr("rel"));
//            }

            print("\nLinks: (%d)", links.size());
            //iterating each <a> tag from links object
         /*   for (Element link : links) {
                print(" * a: <%s>  (%s)", link.attr("abs:href"), trim(link.text(), 35));
               
                //add link to list Collection to only if link contain .htm file
                //if(link.attr("abs:href").contains(".pdf")) {
                	 //adding each link into list Collection object 
                	linksoflink.add(link.attr("abs:href"));
                //}
                if (linksoflink.size() == thrhld) {
                    break;
                }
            }*/
          for (Element article : links) {
                //Only retrieve the titles of the articles that contain Java 8
               if (article.text().matches("^.*?("+upperCaseradionButtoName+"|"+radionButtoName+"|"+firstCharacterUpperCaseradionButtoName+").*$")) {
        	  System.out.println("artical"+article);
                //	 if (article.text().matches("^.*?(SOUND|sound|Sound).*$")) {
                    //Remove the comment from the line below if you want to see it running on your editor, 
                    //or wait for the File at the end of the execution
                    System.out.println("inside "+article.attr("abs:href"));

                    //ArrayList<String> temporary = new ArrayList<>();
                   // temporary.add(article.text()); //The title of the article
                    linksoflink.add(article.attr("abs:href")); //The URL of the article
                    //articles.add(temporary);
                    if (linksoflink.size() == thrhld) {
                        break;
                    }
                }
            }
          
          if(linksoflink.size() == 0) {
        	  for (Element link : links) {
                  print(" * a: <%s>  (%s)", link.attr("abs:href"), trim(link.text(), 35));
                 
                  //add link to list Collection to only if link contain .htm file
                  //if(link.attr("abs:href").contains(".pdf")) {
                  	 //adding each link into list Collection object 
                  	linksoflink.add(link.attr("abs:href"));
                  //}
                  if (linksoflink.size() == thrhld) {
                      break;
                  }
              }
        	  
          }
            
        } catch (Exception ex) {
        	ex.printStackTrace();
        }
        return linksoflink;
    }

    private static void print(String msg, Object... args) {
        System.out.println(String.format(msg, args));
    }

    private static String trim(String s, int width) {
        if (s.length()> width) {
            return s.substring(0, width - 1) + ".";
        } else {
            return s;
        }
    }
 
    
   public static void main(String[] args) {
	
	   List list = new DeepWebsiteListLinks().getWebpageLinks("en.wikipedia.org"
			   							, 10,"light");
	   list.forEach(link->{
		   System.out.println(link);
	   });
	   System.out.println("size is : "+list.size());
	   
   }
}
