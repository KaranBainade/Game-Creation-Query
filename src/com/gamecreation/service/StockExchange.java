package com.gamecreation.service;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.swing.JOptionPane;
import org.json.simple.JSONArray;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.json.simple.parser.JSONParser;

public class StockExchange {

    public void extractData(String url) {
        try {
            Document doc = Jsoup.connect(url).get();
            HashMap<String, String> news = new HashMap<>();
            Elements tbodyTags = doc.select("body tbody");

            System.out.println("Webpage title is: " + doc.title());
            for (Element tag : tbodyTags) {
                Elements trTags = tag.getElementsByTag("tr");
                for (Element trTag : trTags) {
                    Elements thTags = trTag.getElementsByTag("th");
                    for (Element thTag : thTags) {
                        System.out.print(thTag.text() + "\t");
                    }
                    System.out.println();
                }
            }

        } catch (IOException ex) {
            ex.printStackTrace();
            
        } catch (IllegalArgumentException ex) {
            ex.printStackTrace();
        }
    }

    public List<String> extractData1(String url) {
        try {
            Document doc = Jsoup.connect(url).get();
            HashMap<String, String> news = new HashMap<>();
            Elements divTags = doc.select("body div");
            JSONParser parser = new JSONParser();
            int cnt = 0;

            System.out.println("Webpage Title : " + doc.title() + "\n\n");
            for (Element divTag : divTags) {
            //	System.out.println("divtag :: "+divTag);
                Elements tags = divTag.getElementsByAttributeValue("id", "responseDiv");
                System.out.println("tags :: "+tags);
                for (Element tag : tags) {
                    try {
                    	System.out.println("tag :: "+tag);
                        Object obj = parser.parse(tag.text());
                        System.out.println(obj);
                        JSONObject jsonObject = (JSONObject) obj;
                        return printData(jsonObject);
                    } catch (ParseException pe) {
                        System.out.println("position: " + pe.getPosition());
                        System.out.println(pe);
                    }
//                    System.out.println(tag.text());
                }
                break;
            }

        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (IllegalArgumentException ex) {
           ex.printStackTrace();
        }
        return null;
    }

    public List<String> printData(JSONObject jsonObject) {
        String headers = "", s = "";
        List<String> d = new ArrayList<>();

//        s += jsonObject.get("futLink").toString()+"\n";
//        System.out.println("futLink : " + s);
//        JSONArray jsonA = (JSONArray) jsonObject.get("otherSeries");
//        Object getJsonArrayDat = jsonA.get(0);
//        System.out.println("otherSeries : " + getJsonArrayDat);
        headers += "lastUpdateTime,tradedDate,extremeLossMargin,cm_ffm,bcStartDate,change,buyQuantity3,"
                + "sellPrice1,buyQuantity4,sellPrice2,priceBand,buyQuantity1,deliveryQuantity,buyQuantity2,sellPrice5,quantityTraded,buyQuantity5,"
                + "sellPrice3,sellPrice4,open,low52,securityVar,marketType,pricebandupper,totalTradedValue,"
                + "faceValue,ndStartDate,previousClose,symbol,varMargin,lastPrice,pChange,adhocMargin,"
                + "companyName,averagePrice,secDate,series,isinCode,surv_indicator,indexVar,pricebandlower,"
                + "totalBuyQuantity,high52,purpose,cm_adj_low_dt,closePrice,isExDateFlag,recordDate,cm_adj_high_dt,"
                + "totalSellQuantity,dayHigh,exDate,sellQuantity5,bcEndDate,css_status_desc,ndEndDate,"
                + "sellQuantity2,sellQuantity1,buyPrice1,sellQuantity4,buyPrice2,sellQuantity3,applicableMargin,"
                + "buyPrice4,buyPrice3,buyPrice5,dayLow,deliveryToTradedQuantity,totalTradedVolume";
        s += jsonObject.get("lastUpdateTime").toString().replaceAll(",", "") + ",";
        s += jsonObject.get("tradedDate").toString().replaceAll(",", "") + ",";

        JSONArray allData = (JSONArray) jsonObject.get("data");      
        JSONObject data = (JSONObject) allData.get(0);
        s += data.get("extremeLossMargin").toString().replaceAll(",", "") + ",";
        s += data.get("cm_ffm").toString().replaceAll(",", "") + ",";
        s += data.get("bcStartDate").toString().replaceAll(",", "") + ",";
        s += data.get("change").toString().replaceAll(",", "") + ",";
        s += data.get("buyQuantity3").toString().replaceAll(",", "") + ",";
        s += data.get("sellPrice1").toString().replaceAll(",", "") + ",";
        s += data.get("buyQuantity4").toString().replaceAll(",", "") + ",";
        s += data.get("sellPrice2").toString().replaceAll(",", "") + ",";
        s += data.get("priceBand").toString().replaceAll(",", "") + ",";
        s += data.get("buyQuantity1").toString().replaceAll(",", "") + ",";
        s += data.get("deliveryQuantity").toString().replaceAll(",", "") + ",";
        s += data.get("buyQuantity2").toString().replaceAll(",", "") + ",";
        s += data.get("sellPrice5").toString().replaceAll(",", "") + ",";
        s += data.get("quantityTraded").toString().replaceAll(",", "") + ",";
        s += data.get("buyQuantity5").toString().replaceAll(",", "") + ",";
        s += data.get("sellPrice3").toString().replaceAll(",", "") + ",";
        s += data.get("sellPrice4").toString().replaceAll(",", "") + ",";
        s += data.get("open").toString().replaceAll(",", "") + ",";
        s += data.get("low52").toString().replaceAll(",", "") + ",";
        s += data.get("securityVar").toString().replaceAll(",", "") + ",";
        s += data.get("marketType").toString().replaceAll(",", "") + ",";
        s += data.get("pricebandupper").toString().replaceAll(",", "") + ",";
        s += data.get("totalTradedValue").toString().replaceAll(",", "") + ",";
        s += data.get("faceValue").toString().replaceAll(",", "") + ",";
        s += data.get("ndStartDate").toString().replaceAll(",", "") + ",";
        s += data.get("previousClose").toString().replaceAll(",", "") + ",";
        s += data.get("symbol").toString().replaceAll(",", "") + ",";
        s += data.get("varMargin").toString().replaceAll(",", "") + ",";
        s += data.get("lastPrice").toString().replaceAll(",", "") + ",";
        s += data.get("pChange").toString().replaceAll(",", "") + ",";
        s += data.get("adhocMargin").toString().replaceAll(",", "") + ",";
        s += data.get("companyName").toString().replaceAll(",", "") + ",";
        s += data.get("averagePrice").toString().replaceAll(",", "") + ",";
        s += data.get("secDate").toString().replaceAll(",", "") + ",";
        s += data.get("series").toString().replaceAll(",", "") + ",";
        s += data.get("isinCode").toString().replaceAll(",", "") + ",";
        s += data.get("surv_indicator").toString().replaceAll(",", "") + ",";
        s += data.get("indexVar").toString().replaceAll(",", "") + ",";
        s += data.get("pricebandlower").toString().replaceAll(",", "") + ",";
        s += data.get("totalBuyQuantity").toString().replaceAll(",", "") + ",";
        s += data.get("high52").toString().replaceAll(",", "") + ",";
        s += data.get("purpose").toString().replaceAll(",", "") + ",";
        s += data.get("cm_adj_low_dt").toString().replaceAll(",", "") + ",";
        s += data.get("closePrice").toString().replaceAll(",", "") + ",";
        s += data.get("isExDateFlag").toString().replaceAll(",", "") + ",";
        s += data.get("recordDate").toString().replaceAll(",", "") + ",";
        s += data.get("cm_adj_high_dt").toString().replaceAll(",", "") + ",";
        s += data.get("totalSellQuantity").toString().replaceAll(",", "") + ",";
        s += data.get("dayHigh").toString().replaceAll(",", "") + ",";
        s += data.get("exDate").toString().replaceAll(",", "") + ",";
        s += data.get("sellQuantity5").toString().replaceAll(",", "") + ",";
        s += data.get("bcEndDate").toString().replaceAll(",", "") + ",";
        s += data.get("css_status_desc").toString().replaceAll(",", "") + ",";
        s += data.get("ndEndDate").toString().replaceAll(",", "") + ",";
        s += data.get("sellQuantity2").toString().replaceAll(",", "") + ",";
        s += data.get("sellQuantity1").toString().replaceAll(",", "") + ",";
        s += data.get("buyPrice1").toString().replaceAll(",", "") + ",";
        s += data.get("sellQuantity4").toString().replaceAll(",", "") + ",";
        s += data.get("buyPrice2").toString().replaceAll(",", "") + ",";
        s += data.get("sellQuantity3").toString().replaceAll(",", "") + ",";
        s += data.get("applicableMargin").toString().replaceAll(",", "") + ",";
        s += data.get("buyPrice4").toString().replaceAll(",", "") + ",";
        s += data.get("buyPrice3").toString().replaceAll(",", "") + ",";
        s += data.get("buyPrice5").toString().replaceAll(",", "") + ",";
        s += data.get("dayLow").toString().replaceAll(",", "") + ",";
        s += data.get("deliveryToTradedQuantity").toString().replaceAll(",", "") + ",";
        s += data.get("totalTradedVolume").toString().replaceAll(",", "");
//        s += jsonObject.get("optLink").toString()+"\n";
//        System.out.println("optLink : " + s);

        d.add(headers);
        d.add(s);       
       // MainFrame.txtConsole.append("\nData extracted successfully...\n");
        return d;
    }

    public static void main(String[] args) {
        String mainUrl = "https://www.nseindia.com/live_market/dynaContent/live_analysis/top_gainers_losers.htm?cat=G";
//        String mainUrl = "https://www.nseindia.com/live_market/dynaContent/live_analysis/top_gainers_losers.htm?cat=L";

        String dataUrl = "https://www.javatpoint.com/jsoup-example-print-links-of-an-url";
        StockExchange se = new StockExchange();
//        se.extractData(mainUrl);
        se.extractData(dataUrl);
       /* List extractData = se.extractData1(dataUrl);
       System.out.println("Extracted data is :: ");
        extractData.forEach(data->{
        	
        	System.out.println(data);
        });*/
    }
}
