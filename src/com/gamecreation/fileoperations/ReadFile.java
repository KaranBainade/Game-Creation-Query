package com.gamecreation.fileoperations;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class ReadFile {

    List<String> links = new ArrayList<>();

    public List<String> getLinks() {
        return links;
    }

    public StringBuilder read(String fileName, List<String> list) {
        StringBuilder sb = new StringBuilder();
        System.out.println("list "+list.isEmpty());
        System.out.println(fileName);
        System.out.println("list size is:: "+list.size());
        try {
            BufferedReader br = new BufferedReader(new FileReader(fileName));
            String line = new String();
            while ((line = br.readLine()) != null) {
                if (line.equalsIgnoreCase("@data")) {
                    break;
                }
     
            }
            Random rn = new Random();
            int n = 5 - 3 + 1;
            int i = rn.nextInt() % n;
            int randomNum = 3 + i;

            int cnt = 0;
            while ((line = br.readLine()) != null) {
                cnt++;
                try {
                	if (!line.contains("not_relevant")) {
                		if (!line.contains("\n")) {
                			System.out.println(line);
                			String[] arr = line.split(",");
                			sb.append(list.get(Integer.parseInt(arr[0]) - 1)).append("\t").append("\n");
                			links.add(list.get(Integer.parseInt(arr[0]) - 1));
                		}
                	}
//                    if (cnt == randomNum) {
//                        break;
//                    }
                } catch (Exception e) {
                	e.printStackTrace();
                }
            }
        } catch (FileNotFoundException ex) {
//            ex.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return sb;
    }
}
