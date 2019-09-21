/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gamecreation.similarityandranking;

import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.gamecreation.computations.Cosine;

public class SiteRanker {

	
    public TreeMap<String, Double> siteSimilarity(List<String> seedSites, String query) {
       
    	Map<String, Double> rankedSite = new HashMap<>();
//      Cosine_Similarity cs = new Cosine_Similarity();
        System.out.println(">>" + query);
        
        for (String seedSite : seedSites) {
        	System.out.println("inside seed sites");
            String str = seedSite.replaceAll("/", " ");
            System.out.println(seedSite);
            System.out.println(str);
            System.out.println(query);
            
//            double sim_score = cs.Cosine_Similarity_Score(query, seedSite);
//            System.out.println("Cosine Similarity: " + sim_score);
            
            Cosine cos = new Cosine();
            double sim = cos.similarity(str, query);
            System.out.println("sim=="+sim);
            rankedSite.put(seedSite, sim);
            
        }
        //sorting sites
        ValueComparator vc = new ValueComparator(rankedSite);
        TreeMap<String, Double> sortedMap = new TreeMap<>(vc);
        sortedMap.putAll(rankedSite);
        return sortedMap;
    }
    
    public static void main(String[] args) {
		Map<String,Double> map = new SiteRanker().siteSimilarity(Arrays.asList("http://www.facebook.com",
																				"http://www.google.com" ,
																				"http://www.google.com")
																				, "java");
		for(Map.Entry<String,Double> m : map.entrySet() ) {
			
			System.out.println(" key :: "+m.getKey());
			System.out.println(" value :: "+m.getValue());
		}
	}
}

//sorting entries by values 
class ValueComparator implements Comparator<String> {

    Map<String, Double> map = null;

    public ValueComparator(Map<String, Double> base) {
        this.map = base;
    }

    public int compare(String a, String b) {
        if (map.get(a) > map.get(b)) {
            return -1;
        } else  {
            return 1;
        } // returning 0 would merge keys 
    }
    
 }
