package com.gamecreation.pdfformator;

import javax.imageio.ImageIO;

import com.itextpdf.kernel.log.SystemOutCounter;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class ResizeImage {

	private static BufferedImage resize(BufferedImage img, int height, int width) {
       
		Image tmp = img.getScaledInstance(width, height, Image.SCALE_SMOOTH);
        BufferedImage resized = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2d = resized.createGraphics();
        g2d.drawImage(tmp, 0, 0, null);
        g2d.dispose();
        return resized;
        
    }
	/*
	 * reading each image from imagepath and resizing each image
	 * and every image.
	 */
	public  void resizeImages(String imagePath,int imgCount) throws IOException {
		System.out.println(" "+imagePath+"");
		System.out.println("is exists :: "+new File(imagePath).exists());
	    for(int i = 0; i <= imgCount ; i++) {	
	    	
	        File input = new File(imagePath+"/sample"+i+".png");
	        System.out.println("file is exist :: "+input.exists());
	        //reading image
	        BufferedImage image = ImageIO.read(input);
	        
	        //resizing image
	        BufferedImage resized = resize(image, 699, 501);

	        File output = new File(imagePath+"/sample"+i+".png");
	        
	        //writing image
	        ImageIO.write(resized, "png", output);
	    }
	 }
}
	    
	
   /* public static void main(String... args) throws IOException {
    	
        File input = new File(System.getProperty("user.dir")+"/tempImages/duke.png");
        BufferedImage image = ImageIO.read(input);

        BufferedImage resized = resize(image, 500, 500);

        File output = new File(System.getProperty("user.dir")+"/tempImages/duke.png");
        ImageIO.write(resized, "png", output);

    }*/
