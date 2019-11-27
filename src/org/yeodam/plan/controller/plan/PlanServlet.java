package org.yeodam.plan.controller.plan;

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
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * Servlet implementation class PlanServlet
 */
@WebServlet(name = "Plan", urlPatterns = { "/plan" })
public class PlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//api 서울특별시로 키워드 검색하여 배열 만든 후 plan.jsp에 보내줌
		//요청 url
//	    StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/PhotoGalleryService/gallerySearchList"); /*URL*/
////	    urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "fNq7TTxoZ7jwkFG6QPtHK9WSS6jCMYzPxm%2B%2F4BeG48HtwSUjotXBRZZ6kQ9mSn9va0lXwDKk4ZdEnYv6XSXtOQ%3D%3D"); /*Service Key*/
//        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + "fNq7TTxoZ7jwkFG6QPtHK9WSS6jCMYzPxm%2B%2F4BeG48HtwSUjotXBRZZ6kQ9mSn9va0lXwDKk4ZdEnYv6XSXtOQ%3D%3D"); /*공공데이터포털에서 받은 인증키*/
////	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
//        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + "20"); /*한 페이지 결과 수*/
//        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + "ETC"); /*IOS (아이폰), AND (안드로이드), WIN( 윈도우폰), ETC(WEB이나 기타 등등)*/
//        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + "plan"); /*서비스명=어플명*/
//        urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + "%ec%84%9c%ec%9a%b8"); /*요청 키워드(한글 경우,URL인코딩 필요)*/
//        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + "json");
//        URL url = new URL(urlBuilder.toString());
//        //System.out.println(urlBuilder.toString());
//        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//        conn.setRequestMethod("GET");
//        conn.setRequestProperty("Content-type", "application/json");
//        System.out.println("Response code: " + conn.getResponseCode());
//        BufferedReader rd;
//        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
//            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//        } else {
//            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
//        }
//        StringBuilder sb = new StringBuilder();
//        String line;
//        while ((line = rd.readLine()) != null) {
//            sb.append(line);
//        }
//        rd.close();
//        conn.disconnect();
//        
//        
//        //System.out.println(sb.toString());
//        
//        // 이 밑 주석을 할 필요가 없음.. ajax가 아니면 자바스크립트가 받는게 아니라 페이지가 받을 거니까...
//        JsonParser parser = new JsonParser();
//        JsonObject resultInfo = (JsonObject)parser.parse(sb.toString());
//        
//        JsonObject detail1 = resultInfo.getAsJsonObject("response"); //json 오브젝트에서 오브젝트 하나 꺼내옴
//        //System.out.println(detail1);
//        JsonObject detail2 = detail1.getAsJsonObject("body").getAsJsonObject("items");
//        //System.out.println(detail2);
//        JsonArray detail3 = detail2.getAsJsonArray("item");
//        //System.out.println(detail3);
//        
//        ArrayList<Map<String, String>> mapList = new ArrayList<Map<String,String>>();
//        
//        for(int i = 0; i < detail3.size(); i++) {
//        	Map<String, String> touristMap = new HashMap<String,String>();
//        	
//        	touristMap.put("touristAddr", detail3.get(i).getAsJsonObject().get("galPhotographyLocation").getAsString());
//        	touristMap.put("touristTitle",detail3.get(i).getAsJsonObject().get("galTitle").getAsString());
//        	touristMap.put("touristImg",detail3.get(i).getAsJsonObject().get("galWebImageUrl").getAsString());
//        	mapList.add(touristMap);
//        }
//        
//        //System.out.println(mapList);
//        
//        
//        RequestDispatcher rd2 = request.getRequestDispatcher("WEB-INF/views/plan.jsp");
//        request.setAttribute("mapList", mapList);
//        rd2.forward(request, response);
//        
//        
//        //필요한 정보 array plan.jsp에 보내주기
////        response.setContentType("application/json");
////        response.setCharacterEncoding("UTF-8");
////        new Gson().toJson(detail3,response.getWriter());
		 //HttpSession session = request.getSession();
		 //로그인 처리 해야댐
		 //session.setAttribute("member", "pscabc");
         RequestDispatcher red = request.getRequestDispatcher("/WEB-INF/views/plan.jsp");
////         request.setAttribute("touristPhotoList",detail3);
         red.forward(request, response);
	    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
