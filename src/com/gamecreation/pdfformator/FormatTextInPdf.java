package com.gamecreation.pdfformator;

import com.itextpdf.io.font.FontConstants; 

import com.itextpdf.kernel.font.PdfFontFactory; 
import com.itextpdf.kernel.pdf.PdfDocument; 
import com.itextpdf.kernel.pdf.PdfWriter; 

import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph; 
import com.itextpdf.layout.element.Text;
	

public class FormatTextInPdf { 
	
	public static void storedTextInPdfFile(String textData,String pdfFolderPath) throws Exception { 
		   
	      String file = pdfFolderPath+"/formatingTextInPDF.pdf"; 
	      System.out.println("FormatTextInPdf file path is :: "+file);
	      
	      //Creating a PdfDocument object 
	      PdfDocument pdfDoc = new PdfDocument(new PdfWriter(file));     

	      //Creating a Document object 
	      Document doc = new Document(pdfDoc);        

	      //Adding text to the document 
	      Text text1 = new Text(textData);
	     
	      //Setting font to the text  
	      text1.setFont(PdfFontFactory.createFont(FontConstants.HELVETICA)); 
	      
	      //Creating a paragraph 1 
	      Paragraph para1 = new Paragraph(text1); 
	   
	      //Adding paragraphs to the document 
	      doc.add(para1); 
	    
	      //Closing the document 
	      doc.close(); 
	      System.out.println("Text added successfully.."); 
	   }  
	
	
	
  /* public static void main(String args[]) throws Exception { 
	   
      String file = "/media/yogesh/d270bf8f-fb49-468f-b2eb-d67e3e4f62f1/Test/formatingTextInPDF.pdf"; 
      
      //Creating a PdfDocument object 
      PdfDocument pdfDoc = new PdfDocument(new PdfWriter(file));     

      //Creating a Document object 
      Document doc = new Document(pdfDoc);        

      //Adding text to the document 
      Text text1 = new Text("Tutorials Point originated from the idea that there existsa class of readers who respond better to online content and prefer tolearn new skills at their own pace from the comforts of their drawing rooms.");
     
      //Setting font to the text  
      text1.setFont(PdfFontFactory.createFont(FontConstants.HELVETICA)); 
      
      //Creating a paragraph 1 
      Paragraph para1 = new Paragraph(text1); 
   
      //Adding paragraphs to the document 
      doc.add(para1); 
    
      //Closing the document 
      doc.close(); 
      System.out.println("Text added successfully.."); 
   }     */
} 