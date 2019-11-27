package org.yeodam.plan.controller.route;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import org.yeodam.plan.model.dao.RouteDao;
import org.yeodam.plan.model.service.RouteService;

/**
 * Servlet implementation class MstRouteServlet
 */
@WebServlet(name = "MstRoute", urlPatterns = { "/mstRoute" })
public class MstRouteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MstRouteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String distanceArr = request.getParameter("distanceArr");
		int size = Integer.parseInt(request.getParameter("size"));
		System.out.println(distanceArr.toString());
		
		JsonParser parser = new JsonParser();
        JsonArray distanceArrJson = (JsonArray)parser.parse(distanceArr.toString());
        System.out.println("distanceArrJson : "+distanceArrJson);
        
        RouteService service = new RouteService();
        String[] routeResult = service.mstMain(distanceArrJson,size);
        
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json");
        new Gson().toJson(routeResult, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
