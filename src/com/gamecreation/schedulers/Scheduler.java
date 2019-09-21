package com.gamecreation.schedulers;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.PriorityQueue;
import java.util.TreeMap;

import com.gamecreation.fileoperations.Stemming;
import com.gamecreation.fileoperations.StopwordRemove;
import com.gamecreation.fileoperations.TermFrequency;
import com.gamecreation.searchengine.HTMLUtils;

public class Scheduler {

    StopwordRemove stop = null;
    Stemming stem = new Stemming();
    TermFrequency tf = new TermFrequency();
    Map<String, Map<String, Double>> map = new HashMap<>();
    String realPathOfFile =null;
    
    public Scheduler() {
		// TODO Auto-generated constructor stub
	}
    
    public Scheduler(String realPathOfFile) {
    	this.realPathOfFile=realPathOfFile;
    	this.stop=new StopwordRemove(realPathOfFile);
	}

    public Map<String, Map<String, Double>> classify(PriorityQueue<String> topHQueue, boolean flag) {
       
    	while (!topHQueue.isEmpty()) {
        	Map<String, Double> tfCount = new HashMap<>();
            String link = topHQueue.poll();//removes first link from topHQueue
            try {
                String text = new String();
                if (flag == true) {
                    text = HTMLUtils.extractWebText(link);//extracting text data from website page
                } else {
                    text = HTMLUtils.extractText(link);
                }
                System.out.println("text ::"+text);
                text = text.replaceAll("[\\W&&[^\\s]]", " ");
//                System.out.println(text);
                List<String> ll = new ArrayList<>();
                String[] list = text.split(" ");
                for (String list1 : list) {
                    ll.add(list1);
                }

                List<String> sr = stop.removeStopWords(ll);
                List<String> stemming = new ArrayList<>();
                for (String sr1 : sr) {
                    if (!sr1.equals("")) {
                        System.out.print(" " + sr1);
//                        stemming.add(stem.stripAffixes(sr1));
                        stemming.add(sr1);
//                    System.out.print("  "+stem.stripAffixes(sr1));   
                    }
                }
                System.out.println("\n");

//                for (String stem : stemming) {
//                    System.out.print(" " + stem);
                tfCount = tf.genrateTermFrequencyOfWords(stemming);
//                }

                ValueComparator bvc = new ValueComparator(tfCount);
                TreeMap<String, Double> sorted_map = new TreeMap<>(bvc);
                sorted_map.putAll(tfCount);

                System.out.println("\n_____________________________________");

//                for (Map.Entry<String, Integer> entrySet : tfCount.entrySet()) {
//                    String key = entrySet.getKey();
//                    Integer value = entrySet.getValue();
//                    System.out.println(key + "-->" + value);
//
//                }
//                System.out.println("\n_____________________________________");
                if (!sorted_map.isEmpty()) {
                    map.put(link, sorted_map);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            } 
        }
        return map;
    }
}

class ValueComparator implements Comparator {

    Map base;

    public ValueComparator(Map base) {
        this.base = base;
    }

    @Override
    public int compare(Object o1, Object o2) {
        if ((Double) base.get(o1) >= (Double) base.get(o2)) {
            return -1;
        } else {
            return 1;
        } // returning 0 would merge keys
    }
}
