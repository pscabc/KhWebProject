package org.yeodam.plan.controller.clip;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;

import org.yeodam.common.JDBCTemplate;
import org.yeodam.member.model.vo.Member;
import org.yeodam.plan.model.service.ClipService;
import org.yeodam.plan.model.vo.Clip;

/**
 * Servlet implementation class InsertClipServlet
 */
@WebServlet(name = "InsertClip", urlPatterns = { "/insertClip" })
public class InsertClipServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertClipServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		String memberId = member.getMemberId();
		String id = request.getParameter("id");
		String typeId = request.getParameter("typeId");
		System.out.println("inserClipServlet - typeId : "+typeId);
		String clipTitle = request.getParameter("title");
		double mapx = Double.parseDouble(request.getParameter("mapx"));
		double mapy = Double.parseDouble(request.getParameter("mapy"));
		String clipAddr = request.getParameter("addr");
		String clipImage = request.getParameter("image");
		
		Clip clip = new Clip(memberId, clipTitle, clipImage, clipAddr, mapx, mapy, id, typeId);
		
		ClipService service = new ClipService();
		int count = service.insertClip(clip);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(count);
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
