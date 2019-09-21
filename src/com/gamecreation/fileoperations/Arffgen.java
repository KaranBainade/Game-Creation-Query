package com.gamecreation.fileoperations;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.Random;
import java.util.Vector;

public class Arffgen {

    public static ArrayList<String> arr = new ArrayList<String>();

    public void IGArffFileGenerater(Vector attr, Map<Integer, Map<Integer, Double>> mapToFile, String filename, double thold, int flag) {
        BufferedWriter bw = null;
        try {
            bw = new BufferedWriter(new FileWriter(filename));

//            if (flag == 1) {
            bw.write("@RELATION" + " " + "training" + "\n");
            for (int i = 0; i < attr.size(); i++) {
                String atr = attr.get(i).toString();
                atr = atr.replace(", ", "_");
                bw.write("@ATTRIBUTE" + " '" + atr + "' " + "numeric" + "\n");
            }
            bw.write("@ATTRIBUTE" + " '" + "class" + "' " + "{'relevant','not_relevant'}");
            bw.write("\n");
            bw.write("@data" + "\n");
//            }

            int cnt = 0;
            for (Map.Entry<Integer, Map<Integer, Double>> entrySet : mapToFile.entrySet()) {
            	
                Integer key = entrySet.getKey();
                Map<Integer, Double> value = entrySet.getValue();
                
                for (Map.Entry<Integer, Double> entrySet1 : value.entrySet()) {
                	
                    Integer key1 = entrySet1.getKey();
                    Double value1 = entrySet1.getValue();
                    
                    String clas = new String();
                    
                    if (value1 < thold) {
                    	
                        clas = "not_relevant";
                    } else if (value1 >= thold) {
                    	
                        clas = "relevant";
                    }
                    bw.write(key + "," + key1 + "," + value1 + "," + clas + "\n");
                }
                cnt = key;
            }

            Random r = new Random();

//            if (flag == 1) {
//                for (int i = 0; i < 10; i++) {
//                    cnt++;
//                    String s = new String();
//                    int nextInt = r.nextInt(500);
//                    float nextFloat = r.nextFloat() * 6;
//                    int nextInt1 = ((int) (Math.random() + 0.5));
//                    if (nextInt1 == 1) {
//                        s = "relevant";
//                    } else {
//                        s = "not_relevant";
//                    }
//                    bw.write(cnt + "," + nextInt + "," + nextFloat + "," + s + "\n");
//                }
//            }
        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            try {
                bw.close();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }

    public void geratingTestFile(Vector attr, Map<Integer, Map<Integer, Double>> mapToFile, String filename) {
        BufferedWriter bw = null;

        try {
            bw = new BufferedWriter(new FileWriter(filename));
            bw.write("@RELATION" + " " + "testing" + "\n");
            for (int i = 0; i < attr.size(); i++) {
                String atr = attr.get(i).toString();
                atr = atr.replace(", ", "_");
                bw.write("@ATTRIBUTE" + " '" + atr + "' " + "numeric" + "\n");
            }
            bw.write("@ATTRIBUTE" + " '" + "class" + "' " + "{'relevant','not_relevant'}");
            bw.write("\n");
            bw.write("@data" + "\n");

            for (Map.Entry<Integer, Map<Integer, Double>> entrySet : mapToFile.entrySet()) {
                Integer key = entrySet.getKey();
                Map<Integer, Double> value = entrySet.getValue();
                for (Map.Entry<Integer, Double> entrySet1 : value.entrySet()) {
                    Integer key1 = entrySet1.getKey();
                    Double value1 = entrySet1.getValue();
                    String clas = new String();
                    clas = "?";
                    bw.write(key + "," + key1 + "," + value1 + "," + clas + "\n");
                }
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            try {
                bw.close();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
}
