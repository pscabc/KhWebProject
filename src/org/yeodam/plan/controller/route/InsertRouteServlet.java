package org.yeodam.plan.controller.route;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import org.yeodam.member.model.vo.Member;
import org.yeodam.plan.model.service.RouteService;

/**
 * Servlet implementation class InsertRouteServlet
 */
@WebServlet(name = "InsertRoute", urlPatterns = { "/insertRoute" })
public class InsertRouteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertRouteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String plan = (String)request.getParameter("planList");
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		String memberId = member.getMemberId();
		System.out.println("plan : " + plan);

		
		RouteService service = new RouteService();
		int result = service.insertRoute(memberId,plan);
		
		if(result > 0) {
			//route 저장 성공
		}else {
			//route 저장 실패
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/writePlan.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
