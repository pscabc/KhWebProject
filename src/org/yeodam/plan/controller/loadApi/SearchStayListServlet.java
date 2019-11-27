package org.yeodam.plan.controller.loadApi;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * Servlet implementation class SearchStayListServlet
 */
@WebServlet(name = "SearchStayList", urlPatterns = { "/searchStayList" })
public class SearchStayListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchStayListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String areaSeq = request.getParameter("areaSeq");
			System.out.println(areaSeq);
			StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + "fNq7TTxoZ7jwkFG6QPtHK9WSS6jCMYzPxm%2B%2F4BeG48HtwSUjotXBRZZ6kQ9mSn9va0lXwDKk4ZdEnYv6XSXtOQ%3D%3D"); /*Service Key*/
	        //urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("인증키 (URL- Encode)", "UTF-8")); /*공공데이터포털에서 발급받은 인증키*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + "50"); /*한 페이지 결과 수*/
	        //urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + "1"); /*현재 페이지 번호*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + "ETC"); /*IOS(아이폰),AND(안드로이드),WIN(원도우폰),ETC*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + "plan"); /*서비스명=어플명*/
	        urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + "P"); /*(A=제목순,B=조회순,C=수정순,D=생성일순) 대표이미지가 반드시 있는 정렬 (O=제목순, P=조회순, Q=수정일순, R=생성일순)*/
	        urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + areaSeq); /*(A=제목순,B=조회순,C=수정순,D=생성일순) 대표이미지가 반드시 있는 정렬 (O=제목순, P=조회순, Q=수정일순, R=생성일순)*/
	        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + "json"); /*목록구분(Y=목록,N=개수)*/
	        //urlBuilder.append("&" + URLEncoder.encode("catcodeYN","UTF-8") + "=" + "Y"); /*지역코드*/
	        //urlBuilder.append("&" + URLEncoder.encode("addrinfoYN","UTF-8") + "=" + "Y"); /*시군구코드(areaCode 필수)*/
	        //urlBuilder.append("&" + URLEncoder.encode("hanOk","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*한옥 여부*/
	        //urlBuilder.append("&" + URLEncoder.encode("benikia","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*베니키아 여부*/
	        //urlBuilder.append("&" + URLEncoder.encode("goodStay","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*굿스테이 여부*/
	        URL url = new URL(urlBuilder.toString());
	        System.out.println(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
	        
	        JsonParser parser = new JsonParser();	
	        JsonObject resultInfo = (JsonObject)parser.parse(sb.toString());
	        
	        JsonObject detail1 = resultInfo.getAsJsonObject("response"); //json 오브젝트에서 오브젝트 하나 꺼내옴
	        //System.out.println(detail1);
	        JsonObject detail2 = detail1.getAsJsonObject("body").getAsJsonObject("items");
	        //System.out.println(detail2);
	        JsonArray detail3 = detail2.getAsJsonArray("item");
	        System.out.println(detail3);
	        
	        ArrayList<Map<String, String>> mapList = new ArrayList<Map<String,String>>();
	        
	        for(int i = 0; i < detail3.size(); i++) {
	        	Map<String, String> touristMap = new HashMap<String,String>();
	        	
	        	touristMap.put("touristAddr", detail3.get(i).getAsJsonObject().get("addr1").getAsString());
	        	touristMap.put("touristTitle",detail3.get(i).getAsJsonObject().get("title").getAsString());
	        	touristMap.put("touristImg",detail3.get(i).getAsJsonObject().get("firstimage").getAsString());
	        	touristMap.put("mapx",detail3.get(i).getAsJsonObject().get("mapx").getAsString());
	        	touristMap.put("mapy",detail3.get(i).getAsJsonObject().get("mapy").getAsString());
	        	mapList.add(touristMap);
	        }
	        
	        response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(mapList, response.getWriter());
	        

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
