package com.gamecreation.searchengine;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.PriorityQueue;

import com.gamecreation.web.ListLinks;

public class ReverseSearch {

    Map<String, List<String>> linksOfLink = new HashMap<>();
    Map<String, List<String>> siteFrontier = new HashMap<>();
    ListLinks ll = new ListLinks();

    public void setLinksOfLink(Map<String, List<String>> linksOfLink) {
        this.linksOfLink = linksOfLink;
    }

    public Map<String, List<String>> getLinksOfLink() {
        return linksOfLink;
    }

    public List<String> getLinks(String path, String fileName,String dataSetPath) {
        List<String> links = new ArrayList<>();
        try {
        	System.out.println("Query Name :: "+path);
        	System.out.println("filePath :: "+fileName);
        	System.out.println("dataSetPath :: "+dataSetPath);
        	//geting Url link from filepath HTML Code
            List<String> list = LinksExtracter.getURL(dataSetPath + File.separator + path + File.separator + fileName);
            System.out.println(list);
            String str = fileName.substring(0, fileName.lastIndexOf("/"));
            System.out.println("str 1::"+str);
          //  str = str.replace("/", "\\"); //this works on windows
            System.out.println("str 2 "+str);
            for (String list1 : list) {
//                Scanner br = new Scanner("dataset" + File.separator + path + File.separator + str + File.separator + list1);
//                Scanner br = new Scanner(list1);
            	System.out.println("file Loc :: "+dataSetPath+ File.separator  + path +  File.separator +  str + File.separator + list1);
                BufferedReader br = new BufferedReader(new FileReader(dataSetPath+ File.separator  + path +  File.separator +  str + File.separator + list1));
                String substr = new String();
                String dest = new String();
                while ((substr = br.readLine()) != null) {
//                while (br.hasNextLine()) {
//                    substr = br.nextLine();
                    System.out.println(substr);
                    if (substr.contains("URL=")) {
                        dest = substr.substring(substr.lastIndexOf("URL=") + 4, substr.lastIndexOf("\""));
                        System.out.println(dest);
//                        links = LinksExtracter.extractLinks("dataset/" + path + "/" + str + "/" + substr);
                    } else {
                        dest = list1;
//                        links = LinksExtracter.extractLinks("dataset/" + path + "/" + str + "/" + list1);
                    }
                    String link = dataSetPath + File.separator + path + File.separator + str + File.separator + dest;
                    for (String extractLink : LinksExtracter.extractLinks(link)) {
                        String relLink = dataSetPath + File.separator + path + File.separator + str + File.separator + extractLink;
                        relLink = relLink.replace("../", "");
                        System.out.println(relLink);
                        links.add(relLink);
                    }
                }
            }
        } catch (FileNotFoundException ex) {
        	ex.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return links;
    }

    public Map<String, List<String>> checkRelevence(String search, boolean flag, int threshold) {
    	
    	System.out.println(" link of link :: "+linksOfLink.isEmpty()+" \n search :: "+search+" \n flag :: "+flag+"\n threshhold :: "+threshold);
    
    	
        for (Map.Entry<String, List<String>> entrySet : getLinksOfLink().entrySet()) {
        	
        	System.out.println(entrySet);
            String key = entrySet.getKey();
            List<String> link = entrySet.getValue();
            
            System.out.println("link :: "+link);
            if (!link.isEmpty()) {
//                System.out.println(key + "-->" + link);
                for (String val : link) {
                    System.out.println(val + "---->>>\n");
                    String valStr = new String();

//                    System.out.println("==== " + valStr);
                    List<String> frontier = new ArrayList<>();
                    try {
//                        String text = new String();
//                        if (val != null) {
//                            if (flag == true) {
//                                text = HTMLUtils.extractWebText(val);
//                            } else {
//                                text = HTMLUtils.extractText(val);
//                            }
////                            System.out.println(text);
//                        }

//                        System.out.println("");
//                        BufferedReader br = new BufferedReader(new FileReader(val));
//                        String line = new String();
//                        while ((line = br.readLine()) != null) {
//                            System.out.println(">>" + line);
//                        }
//                        if (text != null && !text.isEmpty() && text.contains(search)) {
//                            System.out.println(val);
                        if (flag == true) {
                            for (String extractLink : ll.getWebpageLinks(val,threshold)) {
                                frontier.add(extractLink);
                                System.out.println(extractLink);
//                                if (frontier.size() == threshold) {
//                                    break;
//                                }
                            }
                        } else {
                            for (String extractLink : HTMLUtils.extractLinks(val)) {
                            	System.out.println("1. extractLink :: "+extractLink);
                                if (extractLink.toLowerCase().contains(".htm")) {
                                    extractLink = extractLink.replace("../", "");
                                    System.out.println("2. extractLink :: "+extractLink);
                                    valStr = val.substring(0, val.lastIndexOf("/") + 1);
                                    System.out.println("1. valStr :: "+valStr);
                                    String finalStr = valStr + extractLink;
                                    System.out.println("finalStr :: "+finalStr);
                                    frontier.add(finalStr);
                                    System.out.println(finalStr);
                                }
//                                if (frontier.size() == threshold) {
//                                    break;
//                                }
                            }
                        }
                        //frontier.addAll(HTMLUtils.extractLinks(val));//extract unvisited sites
                        siteFrontier.put(val, frontier);
//                        } else {
//
//                        }
                    } catch (FileNotFoundException ex) {
                    	ex.printStackTrace();
                    } catch (IOException ex) {
                        ex.printStackTrace();
                    }
                }
            }
        }

//        for (Map.Entry<String, List<String>> entrySet : siteFrontier.entrySet()) {
//            String key = entrySet.getKey();
//            List<String> value = entrySet.getValue();
//            System.out.println(key+" $$ "+ value);
//        }
        return siteFrontier;
    }

    public PriorityQueue<String> display(Integer threshold, PriorityQueue<String> sites) {
        PriorityQueue<String> top = new PriorityQueue<>();
        int i = 1;
        for (String site : sites) {
            top.add(site);
//            sb.append("\t").append(site).append("\n");
            if (threshold == i) {
                break;
            }
            i++;
        }
        return top;
    }

}
