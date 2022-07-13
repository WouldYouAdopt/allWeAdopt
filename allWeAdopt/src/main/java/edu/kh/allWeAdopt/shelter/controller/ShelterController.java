package edu.kh.allWeAdopt.shelter.controller;


import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import edu.kh.allWeAdopt.board.model.vo.Board;
import edu.kh.allWeAdopt.shelter.model.service.ShelterReplyService;
import edu.kh.allWeAdopt.shelter.model.service.ShelterService;
import edu.kh.allWeAdopt.shelter.model.vo.Shelter;

@Controller
@RequestMapping("/shelter")
@SessionAttributes({"list"})
public class ShelterController {
	
	@Autowired
	private ShelterService service;
	
	@Autowired
	private ShelterReplyService replyService;
	
	private Logger logger = LoggerFactory.getLogger(ShelterController.class);

	
	
	// 보호소 불러오기
	@GetMapping("/shelterList")
	public String openShelter(Model model, @RequestParam(value="pageNo", required=false, defaultValue = "1") String pageNo,
								@RequestParam(value="upkind", required=false, defaultValue = "")String upkind, 
								@RequestParam(value="upr_cd", required=false, defaultValue = "") String upr_cd
								/* @RequestParam(value="org_cd", required=false, defaultValue = " ") String org_cd */) throws Exception {
		
	    StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic"); /*URL*/
	    urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=ORROf4zK3CwwkwCJ%2Fdt4FRDISXLZQ5w7%2B13CMxRIzMqZz504Vtr86DcBmJqTMgWJgCVfGnafTLBY6kHXgi9CIw%3D%3D"); /*Service Key*/
	    urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8")); /*페이지 번호*/
	    urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("9", "UTF-8")); /*한 페이지 결과 수(1,000 이하)*/
	    urlBuilder.append("&" + URLEncoder.encode("upkind","UTF-8") + "=" + URLEncoder.encode(upkind, "UTF-8")); /*축종코드*/
	    urlBuilder.append("&" + URLEncoder.encode("upr_cd","UTF-8") + "=" + URLEncoder.encode(upr_cd, "UTF-8")); /*시도코드*/
//	    urlBuilder.append("&" + URLEncoder.encode("org_cd","UTF-8") + "=" + URLEncoder.encode(org_cd, "UTF-8")); /*시군구코드*/
	    
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
    	
    		
		for(Element item : itemList) {
			
			String desertionNo = item.getChildText("desertionNo");
			String filename = item.getChildText("filename");
			String happenDt = item.getChildText("happenDt");
			String happenPlace = item.getChildText("happenPlace");
			String kindCd = item.getChildText("kindCd");
			String colorCd = item.getChildText("colorCd");
			String age = item.getChildText("age");
			String weight = item.getChildText("weight");
			String popfile = item.getChildText("popfile");
			String noticeSdt = item.getChildText("noticeSdt");
			String noticeEdt = item.getChildText("noticeEdt");
			String processState = item.getChildText("processState");
			String sexCd = item.getChildText("sexCd");
			String specialMark = item.getChildText("specialMark");	        
			String careNm = item.getChildText("careNm");
			String careAddr = item.getChildText("careAddr");
			String careTel = item.getChildText("careTel");
			
			String numOfRows = item.getChildText("numOfRows");
//			pageNo = item.getChildText("pageNo");
			String totalCount = item.getChildText("totalCount");
			
			Shelter shelter = new Shelter();
			
			shelter.setDesertionNo(desertionNo);
			shelter.setFilename(filename);
			shelter.setHappenDt(happenDt);
			shelter.setHappenPlace(happenPlace);
			shelter.setKindCd(kindCd);
			shelter.setColorCd(colorCd);
			shelter.setAge(age);
			shelter.setWeight(weight);
			shelter.setPopfile(popfile);
			shelter.setNoticeSdt(noticeSdt);
			shelter.setNoticeEdt(noticeEdt);
			shelter.setProcessState(processState);
			shelter.setSexCd(sexCd);
			shelter.setSpecialMark(specialMark);
			shelter.setCareNm(careNm);
			shelter.setCareAddr(careAddr);
			shelter.setCareTel(careTel);
			shelter.setNumOfRows(numOfRows);
//			shelter.setPageNo("10");
			shelter.setTotalCount(totalCount);
			
			
			list.add(shelter);

    	}
	    
	    
//	    System.out.println(shelter.getNumOfRows());
//	    System.out.println(list.get(1));
//		System.out.println(pageNo);
	    
	    model.addAttribute("list", list);	    
	    model.addAttribute("pageNo", pageNo);	    
	    model.addAttribute("upkind", upkind);	    
	    model.addAttribute("upr_cd", upr_cd);	    
//	    model.addAttribute("org_cd", org_cd);	    

		return "shelter/shelter-main";
	}
	
	// 보호소 상세 조회
	@GetMapping("shelterDetail/{desertionNo}")
	public String shelterDetail(@PathVariable("desertionNo") String desertionNo) {
		
//		System.out.println(desertionNo);
		
		return "shelter/shelter-Detail";
	}
	
	
	
	// 전단지 목록 조회 
	@GetMapping("/pamphletList")
	public String pamphletList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model, 
			@RequestParam Map<String, Object> paramMap) {
		
		
		Map<String , Object> map = null;
		
		if(paramMap.get("query") == null) { // 검색이 아닌 경우
			map = service.selectPamphletList(cp);
			
		}else { // 검색인 경우
			
			// 검색에 필요한 데이터를 paramMap에 모두 담아서 서비스 호출
			// -> key, query, cp, boardCode
			
			paramMap.put("cp", cp); // 있으면 같은 값으로 덮어쓰기, 없으면 추가		
			
//			 map = service.searchPamphletList(paramMap);
			
		}
		
		model.addAttribute("map", map);
		
		
		return "shelter/shelter-pamphlet";
	}
	
	
	// 전단지 작성 화면
	@GetMapping("/pamphletWrite")
	public String pamphletWriteForm(String mode, @RequestParam(value="no", required=false, defaultValue="0") int boardNo, Model modell) {
		
//		if(mode.equals("update")) {
//			// 게시글 상세조회 서비스 호출
//			BoardDetail detail = service.selectBoardDetail(boardNo);
//			// -> 개행문자가 <br>로 되어있는 상태 -> textarea 출력 예정이기 때문에 \n으로 변경
//			
//			detail.setBoardContent(Util.newLineClear(detail.getBoardContent()));
//			
//			model.addAttribute("detail", detail);
//		}
		
		return "shelter/shelter-pamphletWrite";
		
	}
	
	
//	// 전단지 작성(삽입/수정)
//	public String pamphletWrite(Board board, )
	
	
	// 파일 업로드
	@RequestMapping(value="/user/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFil(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest req ) {
		
		JsonObject jsonObject = new JsonObject();
		
		String webPath = "/resources/images/board/";
		
		// 컴퓨터 상에서 webPath까지의 실제 경로를 불러옴
		String fileRoot = req.getSession().getServletContext().getRealPath(webPath);
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/resources/images/board/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		String image = jsonObject.toString();
		
		return image;
		
	}
	
	
	
	
}
