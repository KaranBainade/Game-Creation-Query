/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gamecreation.fileoperations;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;
import java.util.Vector;

public class TrainData {

    public void train(String filename) {
        BufferedWriter bw = null;
        Vector attr = new Vector();
        attr.add("document");
        attr.add("word");
        attr.add("weight");
        try {
            bw = new BufferedWriter(new FileWriter(filename));
            bw.write("@RELATION" + " " + "training" + "\n");
            for (int i = 0; i < attr.size(); i++) {
                String atr = attr.get(i).toString();
                atr = atr.replace(", ", "_");
                bw.write("@ATTRIBUTE" + " '" + atr + "' " + "numeric" + "\n");
            }
            bw.write("@ATTRIBUTE" + " '" + "class" + "' " + "{'relevant','not_relevant'}");
            bw.write("\n");
            bw.write("@data" + "\n");
            int cnt = 0;

            Random r = new Random();

            for (int i = 0; i < 30; i++) {
                cnt++;
                String s = new String();
                int nextInt = r.nextInt(500);
                float nextFloat = r.nextFloat() * 6;
                int nextInt1 = ((int) (Math.random() + 0.5));
                if (nextInt1 == 1) {
                    s = "relevant";
                } else {
                    s = "not_relevant";
                }
                bw.write(cnt + "," + nextInt + "," + nextFloat + "," + s + "\n");
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
