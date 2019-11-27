package org.yeodam.plan.controller.intro;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * Servlet implementation class IntroShopServlet
 */
@WebServlet(name = "IntroShop", urlPatterns = { "/introShop" })
public class IntroShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntroShopServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("IntroTouristServlet 시작");
		String typeId = (String)request.getParameter("typeId");
		String id = (String)request.getParameter("id");
		String title = (String)request.getParameter("title");
		String image = (String)request.getParameter("image");
		String index = (String)request.getParameter("index");
		System.out.println("intro - index : " + index);
		System.out.println("typeId : "+typeId+ " id : "+id);
		System.out.println("title : "+title+" image : "+image);
		
		//디테일 페이지 조회
		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro"); 
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + "fNq7TTxoZ7jwkFG6QPtHK9WSS6jCMYzPxm%2B%2F4BeG48HtwSUjotXBRZZ6kQ9mSn9va0lXwDKk4ZdEnYv6XSXtOQ%3D%3D");
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + "5");
        //urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + "1"); 
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + "ETC");
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + "plan");
        urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + id); 
        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + typeId);
        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + "json");
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
        System.out.println("detail1 : "+detail1);
        JsonObject detail2 = detail1.getAsJsonObject("body").getAsJsonObject("items");
        System.out.println("detail2 : "+detail2);
        JsonObject detail3 = detail2.getAsJsonObject("item");
        System.out.println("detail3 : "+detail3);
        
        Map<String, String> touristMap = new HashMap<String,String>();
        
        JsonObject jo = detail3.getAsJsonObject();
        touristMap.put("chkbabycarriageshopping",jo.has("chkbabycarriageshopping")?jo.get("chkbabycarriageshopping").getAsString():"");
        touristMap.put("infocentershopping",jo.has("infocentershopping")?jo.get("infocentershopping").getAsString():"");
        touristMap.put("opentime",jo.has("opentime")?jo.get("opentime").getAsString():"");
        touristMap.put("parkingshopping",jo.has("parkingshopping")?jo.get("parkingshopping").getAsString():"");
        touristMap.put("saleitem",jo.has("saleitem")?jo.get("saleitem").getAsString():"");
        touristMap.put("saleitemcost",jo.has("saleitemcost")?jo.get("saleitemcost").getAsString():"");
        touristMap.put("shopguide",jo.has("shopguide")?jo.get("shopguide").getAsString():"");
        touristMap.put("image",image);
        touristMap.put("title",title);
		
		//detailcommon api 조회
        System.out.println("detailCommon 조회 시작//");
		StringBuilder urlBuilder2 = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon"); 
        urlBuilder2.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + "fNq7TTxoZ7jwkFG6QPtHK9WSS6jCMYzPxm%2B%2F4BeG48HtwSUjotXBRZZ6kQ9mSn9va0lXwDKk4ZdEnYv6XSXtOQ%3D%3D");
        //urlBuilder2.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + "1");
        //urlBuilder2.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + "1"); 
        urlBuilder2.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + "ETC");
        urlBuilder2.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + "plan");
        urlBuilder2.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + id); 
//        urlBuilder2.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + typeId);
        urlBuilder2.append("&" + URLEncoder.encode("defaultYN","UTF-8") + "=" + "Y"); 
        urlBuilder2.append("&" + URLEncoder.encode("firstImageYN","UTF-8") + "=" + "Y"); 
        urlBuilder2.append("&" + URLEncoder.encode("areacodeYN","UTF-8") + "=" + "Y"); 
        urlBuilder2.append("&" + URLEncoder.encode("catcodeYN","UTF-8") + "=" + "Y"); 
        urlBuilder2.append("&" + URLEncoder.encode("addrinfoYN","UTF-8") + "=" + "Y"); 
        urlBuilder2.append("&" + URLEncoder.encode("mapinfoYN","UTF-8") + "=" + "Y"); 
        urlBuilder2.append("&" + URLEncoder.encode("overviewYN","UTF-8") + "=" + "Y"); 
        urlBuilder2.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + "json");
        
        URL url2 = new URL(urlBuilder2.toString());
        System.out.println("detailCommon : "+urlBuilder2.toString());
        HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
        conn2.setRequestMethod("GET");
        conn2.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn2.getResponseCode());
        BufferedReader rd2;
        if(conn2.getResponseCode() >= 200 && conn2.getResponseCode() <= 300) {
            rd2 = new BufferedReader(new InputStreamReader(conn2.getInputStream()));
        } else {
            rd2 = new BufferedReader(new InputStreamReader(conn2.getErrorStream()));
        }
        StringBuilder sb2 = new StringBuilder();
        String line2;
        while ((line2 = rd2.readLine()) != null) {
            sb2.append(line2);
        }
        rd2.close();
        conn2.disconnect();
        System.out.println(sb2.toString());
        
        JsonParser parser2 = new JsonParser();	
        JsonObject resultInfo2 = (JsonObject)parser2.parse(sb2.toString());
        
        JsonObject detail4 = resultInfo2.getAsJsonObject("response"); //json 오브젝트에서 오브젝트 하나 꺼내옴
        System.out.println("detail4 : "+detail4);
        JsonObject detail5 = detail4.getAsJsonObject("body").getAsJsonObject("items");
        System.out.println("detail5 : "+detail5);
        JsonObject detail6 = detail5.getAsJsonObject("item");
        System.out.println("detail6 : "+detail6);
        
                
        JsonObject jo2 = detail6.getAsJsonObject();
        touristMap.put("mapx", jo2.has("mapx") ? jo2.get("mapx").getAsString() : "");
        touristMap.put("addr1", jo2.has("addr1") ? jo2.get("addr1").getAsString() : "");
        touristMap.put("homepage", jo2.has("homepage") ? jo2.get("homepage").getAsString() : "");
        touristMap.put("mapy",jo2.has("mapy")?jo2.get("mapy").getAsString():"");
        touristMap.put("overview",jo2.has("overview")?jo2.get("overview").getAsString():"");
        touristMap.put("zipcode",jo2.has("zipcode")?jo2.get("zipcode").getAsString():"");
        
        String mapX = detail6.getAsJsonObject().get("mapx").getAsString();
        String mapY = detail6.getAsJsonObject().get("mapy").getAsString();
        
        System.out.println("mapX : " +mapX+" mapY : "+mapY);
        
        
        //위치 기반 주변 음식점 검색
        System.out.println("detailCommon 조회 시작//");
		StringBuilder urlBuilder3 = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList"); 
        urlBuilder3.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + "fNq7TTxoZ7jwkFG6QPtHK9WSS6jCMYzPxm%2B%2F4BeG48HtwSUjotXBRZZ6kQ9mSn9va0lXwDKk4ZdEnYv6XSXtOQ%3D%3D");
        urlBuilder3.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + "20");
        //urlBuilder2.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + "1"); 
        urlBuilder3.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + "ETC");
        urlBuilder3.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + "plan");
        urlBuilder3.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + "A"); 
        urlBuilder3.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + typeId);
        urlBuilder3.append("&" + URLEncoder.encode("mapX","UTF-8") + "=" + mapX); 
        urlBuilder3.append("&" + URLEncoder.encode("mapY","UTF-8") + "=" + mapY); 
        urlBuilder3.append("&" + URLEncoder.encode("radius","UTF-8") + "=" + "5000"); 
        urlBuilder3.append("&" + URLEncoder.encode("listYN","UTF-8") + "=" + "Y"); 
        urlBuilder3.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + "json");
        
        URL url3 = new URL(urlBuilder3.toString());
        System.out.println("detailBased : "+urlBuilder3.toString());
        HttpURLConnection conn3 = (HttpURLConnection) url3.openConnection();
        conn3.setRequestMethod("GET");
        conn3.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn3.getResponseCode());
        BufferedReader rd3;
        if(conn3.getResponseCode() >= 200 && conn3.getResponseCode() <= 300) {
            rd3 = new BufferedReader(new InputStreamReader(conn3.getInputStream()));
        } else {
            rd3 = new BufferedReader(new InputStreamReader(conn3.getErrorStream()));
        }
        StringBuilder sb3 = new StringBuilder();
        String line3;
        while ((line3 = rd3.readLine()) != null) {
            sb3.append(line3);
        }
        rd3.close();
        conn3.disconnect();
        System.out.println(sb3.toString());
        
        JsonParser parser3 = new JsonParser();	
        JsonObject resultInfo3 = (JsonObject)parser3.parse(sb3.toString());
        
        JsonObject detail7 = resultInfo3.getAsJsonObject("response"); //json 오브젝트에서 오브젝트 하나 꺼내옴
        System.out.println("detail7 : "+detail7);
        JsonObject detail8 = detail7.getAsJsonObject("body").getAsJsonObject("items");
        System.out.println("detail8 : "+detail8);
        
        
        if(detail8.get("item").isJsonObject()) {
        	JsonObject detail9 = detail8.getAsJsonObject("item");
        	JsonObject jo3 = detail9.getAsJsonObject();
        	Map<String, String> nearMap = new HashMap<String,String>();
        	
        
        	nearMap.put("addr1", jo3.has("addr1") ? jo3.get("addr1").getAsString() : "");
        	nearMap.put("contenttypeid", jo3.has("contenttypeid") ? jo3.get("contenttypeid").getAsString() : "");
        	nearMap.put("contentid", jo3.has("contentid") ? jo3.get("contentid").getAsString() : "");
        	nearMap.put("title", jo3.has("title") ? jo3.get("title").getAsString() : "");
        	nearMap.put("firstimage", jo3.has("firstimage") ? jo3.get("firstimage").getAsString() : "/img/사진없음.jpg");
        	
        	request.setAttribute("nearMap", nearMap);
        	System.out.println("detail9 : "+detail9);
        
        }else {
        	JsonArray detail9 = detail8.getAsJsonArray("item");
        	ArrayList<Map<String, String>> nearMapList = new ArrayList<Map<String,String>>();
	        for(int i = 0; i < detail9.size(); i++) {
	        	Map<String, String> nearMap = new HashMap<String,String>();
	        	JsonObject jo3 = detail9.get(i).getAsJsonObject();
	        
	        	nearMap.put("addr1", jo3.has("addr1") ? jo3.get("addr1").getAsString() : "");
	        	nearMap.put("contenttypeid", jo3.has("contenttypeid") ? jo3.get("contenttypeid").getAsString() : "");
	        	nearMap.put("contentid", jo3.has("contentid") ? jo3.get("contentid").getAsString() : "");
	        	nearMap.put("title", jo3.has("title") ? jo3.get("title").getAsString() : "");
	        	nearMap.put("firstimage", jo3.has("firstimage") ? jo3.get("firstimage").getAsString() : "/img/사진없음.jpg");
	        	
	        	nearMapList.add(nearMap);
	        }
	        request.setAttribute("nearMapList", nearMapList);
	        System.out.println("detail9 : "+detail9);
        }
        
        RequestDispatcher red2 = request.getRequestDispatcher("/WEB-INF/views/introTour/introRes.jsp");
        request.setAttribute("touristMap", touristMap);
        request.setAttribute("index", index);
        request.setAttribute("typeId", typeId);
        request.setAttribute("id", id);
        System.out.println("introResSrv - index : " +index);
        red2.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
