package com.gamecreation.service;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

import com.gamecreation.pdfformator.FormatTextInPdf;
import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;

public class GoogleRes {

	
	public static void convertWebpageIntoPDF (String url,String pdfFolderPath) throws FailingHttpStatusCodeException, MalformedURLException, IOException,Exception {
		
		HtmlPage page = null ;
		System.out.println("Url is :: "+url);
		System.out.println("pdfFolderPath is :: "+pdfFolderPath);
		
		WebClient webClient = new WebClient(BrowserVersion.CHROME);
		webClient.getOptions().setJavaScriptEnabled(false);
		
		if( !url.startsWith("http" ) ) {
			page = (HtmlPage) webClient.getPage("file://"+url);
		}else {
			page = (HtmlPage) webClient.getPage(url);
		}
		//System.out.println(page.asXml());
		
		//HtmlPage page = (HtmlPage) webClient.getPage("file:///media/yogesh/d270bf8f-fb49-468f-b2eb-d67e3e4f62f1/Eclipse_Workspace01/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/GameCreationForSearchQuery/dataset/Books/homecached/1stcyberstore.com_1/terms.shtml.html");
		
		//stored this html code into html file
		String strToHtml = page.asXml();
		//retriving all text from webpage
		String pageContent = page.asText();
		
		//System.out.println(pdfToHtml);
		String htmlFilePath = pdfFolderPath+"/pdf.html";
		String pdfPath = pdfFolderPath+"/html.pdf";
		System.out.println("html file path is :: "+htmlFilePath);
		
		//writing html string data to .html file 
		writeStringToHtml(strToHtml, htmlFilePath);
		//Converting html to pdf
		
		generatePDFFromHTML(htmlFilePath, pdfPath);
		//Files.write(Paths.get(pdfFolderPath+"/pdf.html"), pdfToHtml.getBytes(),StandardOpenOption.CREATE);
		
		//task 
			//passs that html file path to generatePDFFromHTML methodss
		
		
		
		//sending all extracted text of webpage to  FormatTextInPdf
		FormatTextInPdf.storedTextInPdfFile(pageContent,pdfFolderPath);
		//System.out.println(pageContent);
		
		webClient.close();
	}
	
	 private static void writeStringToHtml(String strContent,String HtmlFilePath) {
         
	        BufferedWriter bufferedWriter = null;
	        try {
	            //String strContent = "This example shows how to write string content to a file";
	            File myFile = new File(HtmlFilePath);
	            // check if file exist, otherwise create the file before writing
	            if (!myFile.exists()) {
	                myFile.createNewFile();
	            }
	            Writer writer = new FileWriter(myFile);
	            bufferedWriter = new BufferedWriter(writer);
	            bufferedWriter.write(strContent);
	        } catch (IOException e) {
	            e.printStackTrace();
	        } finally{
	            try{
	                if(bufferedWriter != null) 
	                	bufferedWriter.close();
	            } catch(Exception ex){
	                 ex.printStackTrace();
	            }
	        }
	   }
	 
	private static void generatePDFFromHTML(String filename,String pdfPath) throws DocumentException, IOException {
	    Document document = new Document();
	    PdfWriter writer = PdfWriter.getInstance(document,
	    		new FileOutputStream(pdfPath));
	    document.open();
	    FileInputStream file =  new FileInputStream(filename);
	    System.out.println(file);
	    System.out.println(writer);
	    System.out.println(document);
	    XMLWorkerHelper xmlWorkerHelper = XMLWorkerHelper.getInstance();
	    System.out.println(xmlWorkerHelper);
	    xmlWorkerHelper.parseXHtml(writer, document,
	    		file);
	    document.close();
	}
	
	
	
	/*
	 * public static void main(String[] args) throws FailingHttpStatusCodeException,
	 * MalformedURLException, IOException {
	 * 
	 * // Initailzing Webclient Object to imitate chrome browser WebClient webClient
	 * = new WebClient(BrowserVersion.CHROME);
	 * webClient.getOptions().setJavaScriptEnabled(false);
	 * webClient.getOptions().setThrowExceptionOnFailingStatusCode(false);
	 * webClient.getOptions().setThrowExceptionOnScriptError(false);
	 * 
	 * // List of programming language names to find no.of results String[]
	 * searchString = { "java", "javastring", "php", "c++", "c#", "visual basic",
	 * "clojure", "simula", "ruby", "python", "objective-c", "matlab" }; HtmlPage
	 * page = webClient.getPage("https://google.com/");
	 * 
	 * // Getting Form from google home page. tsf is the form name HtmlForm form =
	 * page.getHtmlElementById("tsf");
	 * 
	 * // Iterate programming languages to find no.of results for (int j = 0; j <
	 * searchString.length; j++) {
	 * 
	 * 
	 * Setting programming language name as value in search box in google search
	 * home page
	 * 
	 * form.getInputByName("q").setValueAttribute(searchString[j]);
	 * 
	 * // Creating a virtual submit button HtmlButton submitButton = (HtmlButton)
	 * page.createElement("button"); submitButton.setAttribute("type", "submit");
	 * form.appendChild(submitButton);
	 * 
	 * // Submitting the form and getting the result HtmlPage newPage =
	 * submitButton.click();
	 * 
	 * // Getting the result as text String pageText = newPage.asText(); String
	 * results[] = pageText.split("\n");
	 * 
	 * // Getting the lines which contains the no.of results value. for (int i = 0;
	 * i < results.length; i++) { if (results[i].contains("About") &&
	 * results[i].contains("results")) System.out.println(searchString[j] + "-----"
	 * + results[i]); } } }
	 */

	public static void main(String[] args) throws FailingHttpStatusCodeException, MalformedURLException, IOException {
		
		WebClient webClient = new WebClient(BrowserVersion.CHROME);
		webClient.getOptions().setJavaScriptEnabled(false);
		HtmlPage page = (HtmlPage) webClient.getPage("https://www.geeksforgeeks.org/java");
		String pageContent = page.asText();
		String title = page.getTitleText();
		
		String pdfToHtml = page.asXml();
		
		Files.write(Paths.get("./pdf.html"), pdfToHtml.getBytes());

		
		
		//System.out.println(page.getElementById("<div>"));
		
	//	System.out.println(pageContent);
	}
	
	
	
	

}
