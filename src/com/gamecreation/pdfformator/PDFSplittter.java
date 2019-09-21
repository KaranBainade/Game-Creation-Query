package com.gamecreation.pdfformator;

import org.apache.commons.io.FileUtils;
import org.apache.pdfbox.multipdf.Splitter; 
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.rendering.ImageType;
import org.apache.pdfbox.rendering.PDFRenderer;
import org.apache.pdfbox.tools.imageio.ImageIOUtil;

import java.awt.image.BufferedImage;
import java.io.File; 
import java.io.IOException; 
import java.util.List; 
import java.util.Iterator;
  
public class PDFSplittter {
	//this static varible will stored total number of pages 
	public static int pageCounter = 0;
	/*
	 * this method will converting pdf files each doc page  as images and storing each
	 *  image in saperate folder
	 */
	 public int splitPdfFile(String pdfFolderPath,String imagePath)  throws Exception{
		 //deleting existing images from directory
		 deleteAllFilesOfDirectory(imagePath);
		 //laoding pdf file
	     try (final PDDocument document = PDDocument.load(new File(pdfFolderPath+"/formatingTextInPDF.pdf"))){
	    	 //rendering document to PdfRenderer class
	          PDFRenderer pdfRenderer = new PDFRenderer(document);
	          
	          //iterating each pdf docs and converting to .png images
	          for (int page = 0; page < document.getNumberOfPages(); ++page){
	        	  
	              BufferedImage bim = pdfRenderer.renderImageWithDPI(page, 300, ImageType.RGB);
	              String fileName =imagePath+"/sample" + page + ".png";
	              ImageIOUtil.writeImage(bim, fileName, 300);
	              pageCounter = page;
	          }
	          
	      } catch (IOException e){
	          System.err.println("Exception while trying to create pdf document - " + e);
	      }
	            
	      System.out.println("Multiple images created");
	      return pageCounter;
	   }
	 private void deleteAllFilesOfDirectory(String imagePath) throws IOException {
		 FileUtils.cleanDirectory(new File(imagePath)); 
	 }
	
	 //main method 
   /*public static void main(String[] args) throws IOException {

      //Loading an existing PDF document
      File file = new File("Light.pdf");
      
            try (final PDDocument document = PDDocument.load(new File("Light.pdf"))){
          PDFRenderer pdfRenderer = new PDFRenderer(document);
          for (int page = 0; page < document.getNumberOfPages(); ++page)
          {
              BufferedImage bim = pdfRenderer.renderImageWithDPI(page, 300, ImageType.RGB);
              String fileName ="pdfSplitedOutput/sample" + page + ".png";
              ImageIOUtil.writeImage(bim, fileName, 300);
          }
          document.close();
      } catch (IOException e){
          System.err.println("Exception while trying to create pdf document - " + e);
      }
      
   
      System.out.println("Multiple PDF’s created");
      //document.close();
   }*/
}



/*import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfImportedPage;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfWriter;


public class PDFSplittter {
	static void splitPdfFile(InputStream inputPdf,
            OutputStream outputStream, int startPage,
            int endPage) throws Exception{
		//Create document and pdfReader objects.
		Document document = new Document();
        PdfReader pdfReader = new PdfReader(inputPdf);
 
        //Get total no. of pages in the pdf file.
        int totalPages = pdfReader.getNumberOfPages();
 
        //Check the startPage should not be greater than the endPage
        //and endPage should not be greater than total no. of pages.
        if(startPage > endPage || endPage > totalPages) {
           System.out.println("Kindly pass the valid values " +
           		"for startPage and endPage.");
        }else{
        	 // Create writer for the outputStream
	        PdfWriter writer = 
	            PdfWriter.getInstance(document, outputStream);
 
	        //Open document
	        document.open();
 
	       //Contain the pdf data.
	        PdfContentByte pdfContentByte = 
	        		writer.getDirectContent(); 
	        PdfImportedPage page;
 
	        while(startPage <= endPage) {
	          document.newPage();
	          page=writer.getImportedPage(pdfReader, startPage);
	          pdfContentByte.addTemplate(page, 0, 0);
	          startPage++;
	        }
 
	        //Close document and outputStream.
	        outputStream.flush();
	        document.close();
	        outputStream.close();
        }	       
	}
 
	public static void main(String args[]){
	 try {			
	    //Prepare output stream for 
	    //new pdf file after split process.
            OutputStream outputStream1 = 
            		new FileOutputStream("SplitFile1.pdf");
            OutputStream outputStream2 = 
            		new FileOutputStream("SplitFile2.pdf");
 
            //call method to split pdf file.
            splitPdfFile(new FileInputStream("Light.pdf"),
            		outputStream1, 1, 8);    
            splitPdfFile(new FileInputStream("D:\\TestFile.pdf"),
            		outputStream2, 11, 20);  
 
            System.out.println("Pdf file splitted successfully.");
	  } catch (Exception e) {
		e.printStackTrace();
	  }
    }
}*/


