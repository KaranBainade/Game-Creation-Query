package com.gamecreation.service;

import java.io.File;
import java.io.FileNotFoundException;

/*
 * This class contain game.jsp page releted business logic 
 */
public class GamePageService {

	//This method will giving total number of images present in
	//image folder dynamicallly
	public  int getTotalImages(String imageFolderPath) throws Exception{
		int totalImgCount = 0;
		try {
			//fetching total number of file present in given directory
			totalImgCount = new File(imageFolderPath).list().length;
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
		return totalImgCount;
	}
	
	/*public static void main(String[] args) {
		try {
			System.out.println(" "+new GamePageService().getTotalImages(System.getProperty("user.dir")+"/pdfSplitedOutput"));
		}catch(Exception e) {
			System.out.println(" "+e.getMessage());
		}
	}*/
	
}
