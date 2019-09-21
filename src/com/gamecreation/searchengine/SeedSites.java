package com.gamecreation.searchengine;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SeedSites {

    public SeedSites() {
    }

    public List<String> getSeedSites(String searchString, Integer threshold, List<String> file,String datasetPath) {
//        String[] searchWords = searchString.trim().split(" ");
    	
        List<String> list = file;
        List<String> returnList = new ArrayList<>();
        //StringBuilder sb = new StringBuilder();
      //  Map<String, List<String>> reverseSearchLinks = new HashMap<>();
        
        System.out.println(" in get Seedsites ");
        System.out.println("is it empty ::  "+file.isEmpty());
        System.out.println(datasetPath);
        
    
        for (String file1 : list) {
        	 System.out.println(" inside for loop ");
        	System.out.println(file1);
        	/*if(!new File(file1).exists()) {
        		System.out.println(file1 +" not Exists..!");
        	}else {
        		System.out.println(file1 +"  Exists..!");
        	}*/
            try {
                int i = 0;
                String[] str = file1.split("\\.");
              //  System.out.println("str  :: "+str);
                String str1 = datasetPath + File.separator;
              //  System.out.println("str 1  :: "+str1);
                String str2 = str[0];
             //   System.out.println("str 2 :: "+str2);
                String str3 = file1;
              //  System.out.println("str 3 :: "+str3);
                List<String> links = new ArrayList<>();
                if (str[1].equalsIgnoreCase("htm") || str[1].equalsIgnoreCase("html")) {
//                    for (String searchW : searchWords) {
                        if (searchString.equalsIgnoreCase(str2)) {
                        	String filePath = str1 + str2 + File.separator + str3;
                        	//if file is not exists  then not addding in map object
                        		System.out.println("  filePath :: "+filePath);
                        		
                        		links = HTMLUtils.extractLinks(filePath);
                        		
                                for (String link : links) {
                                	String checkFilePath = str1 + str2 + File.separator +link;
                                	System.out.println("checkFilePath :: "+checkFilePath);
                                	
                                	if( !new File(checkFilePath).exists()) {
                                		continue;
                                	}else {
                                		i++;
//                                		System.out.println(link);
                                		returnList.add(link);
                                	//	sb.append("\t").append(link).append("\n");
                                		if (threshold.equals(i)) {
                                			break;
                                		}
                                }
                               // reverseSearchLinks.put(file1, links);
//                                break;
                        	}
                        }
//                    }
                    
                    //keyword not present in the dataset
                  /*  if(reverseSearchLinks.size()<=0){
                        
                    }*/
                    
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            } catch (ArrayIndexOutOfBoundsException e) {
            }
        }
//        for (Map.Entry<String, List<String>> entrySet : reverseSearchLinks.entrySet()) {
//            String key = entrySet.getKey();
//            List<String> value = entrySet.getValue();
//            System.out.println(key + "--->>");
//            for (String value1 : value) {
//                System.out.println(value1);
//            }
//        }
        return returnList;
    }
}
