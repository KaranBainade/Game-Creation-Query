/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gamecreation.textfieldop;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class Dictionary {

    public ArrayList<String> read() {
        char c = 'a';
        ArrayList<String> list = new ArrayList<>();
        try {
            BufferedReader br = new BufferedReader(new FileReader("words.txt"));
            String line = new String();

            while ((line = br.readLine()) != null) {
                if (line.contains("'")) {
//                    line = line.replaceAll("[\\W&&[^\\s]]", " ");
                    line = line.replaceAll("'", "");
                }
                if (line.length() > 4) {
                    int cnt = 0;
                    while (line.startsWith(String.valueOf(c))) {

                        line = br.readLine();
                        if (line.contains("'")) {
//                    line = line.replaceAll("[\\W&&[^\\s]]", " ");
                            line = line.replaceAll("'", "");
                        }
                        if (line.length() > 4) {

                            list.add(line.trim());
                            cnt++;
                            if (cnt == 50) {
                                c++;
                                break;
                            }
                        }
                    }

                }
            }
        } catch (FileNotFoundException ex) {
            ex.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        }

//        for (String string : list) {
//            System.out.println(string);
//        }
        return list;
    }

    public static void main(String[] args) {
        Dictionary dictionary = new Dictionary();
        ArrayList<String> words = dictionary.read();
    }
}
