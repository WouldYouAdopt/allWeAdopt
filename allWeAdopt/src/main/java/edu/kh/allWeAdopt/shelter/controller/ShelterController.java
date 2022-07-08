package edu.kh.allWeAdopt.shelter.controller;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;


import edu.kh.allWeAdopt.shelter.model.service.ShelterService;
import edu.kh.allWeAdopt.shelter.model.vo.Shelter;

@Controller
@RequestMapping("/shelter")
@SessionAttributes({"shelter"})
public class ShelterController {
	
	@Autowired
	private ShelterService service;
	
	private Logger logger = LoggerFactory.getLogger(ShelterController.class);

	
	
	// 보호소 불러오기
	@GetMapping("/mainShelter")
	public String openShelter(Model model) throws Exception {
		
	    StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic"); /*URL*/
	    urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=ORROf4zK3CwwkwCJ%2Fdt4FRDISXLZQ5w7%2B13CMxRIzMqZz504Vtr86DcBmJqTMgWJgCVfGnafTLBY6kHXgi9CIw%3D%3D"); /*Service Key*/
	    urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("5", "UTF-8")); /*페이지 번호*/
	    urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수(1,000 이하)*/
//	    urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode(" ", "UTF-8")); /*xml(기본값) 또는 json*/
	       
	    URL url = new URL(urlBuilder.toString());
	       
	    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	
	    conn.setRequestProperty("Content-type", "application/xml");
	       
	    conn.connect();
	    	        
	    System.out.println("Response code: " + conn.getResponseCode());
	    
	    SAXBuilder builder = new SAXBuilder();
	    
	    Document document = builder.build(conn.getInputStream());
	    
	    Element root = document.getRootElement();
	    
	    Element body = root.getChild("body");
	    
	    Element items = body.getChild("items");
	    
	    List<Element> itemList = items.getChildren("item");
	    
	    List<Shelter> list = new ArrayList<Shelter>();
	    
    	Shelter shelter = new Shelter();
	    
	    for(Element item : itemList) {
	    	
//	    	String resultCode = item.getChildText("reqNo");
//	    	String resultMsg = item.getChildText("resultMsg");
	    	String careNm = item.getChildText("careNm");
	    	String orgNm = item.getChildText("orgNm");
//	    	String divisionNm = item.getChildText("divisionNm");
	    	String careAddr = item.getChildText("careAddr");
	    	String lat = item.getChildText("lat");
	    	String lng = item.getChildText("lng");
	    	String careTel = item.getChildText("careTel");
//	    	String dataStdDt = item.getChildText("dataStdDt");
	    	String numOfRows = item.getChildText("numOfRows");
//	    	String pageNo = item.getChildText("pageNo");
//	    	String totalCount = item.getChildText("totalCount");
	    	

	         String reqNo = item.getChildText("reqNo");
	         String filename = item.getChildText("filename");
	         String happenDt = item.getChildText("happenDt");
	         String happenPlace = item.getChildText("happenPlace");
	         String kindCd = item.getChildText("kindCd");
	         String colorCd = item.getChildText("colorCd");
	         String age = item.getChildText("age");
	         String weight = item.getChildText("weight");
	         String popfile = item.getChildText("popfile");

	    	
	    	
	         shelter.setReqNo(reqNo);
	         shelter.setFilename(filename);
	         shelter.setHappenDt(happenDt);
	         shelter.setHappenPlace(happenPlace);
	         shelter.setKindCd(kindCd);
	         shelter.setColorCd(colorCd);
	         shelter.setAge(age);
	         shelter.setWeight(weight);
	         shelter.setPopfile(popfile);
	         shelter.setCareNm(careNm);
	         shelter.setOrgNm(orgNm);
	         shelter.setCareAddr(careAddr);
	         shelter.setLat(lat);
	         shelter.setLng(lng);
	         shelter.setCareTel(careTel);
	         shelter.setNumOfRows(numOfRows);

	    	
	    	list.add(shelter);
	    	
	    }
	    
	    model.addAttribute("shelter", shelter);	    

		return "shelter/mainShelter";
	}
	
}
