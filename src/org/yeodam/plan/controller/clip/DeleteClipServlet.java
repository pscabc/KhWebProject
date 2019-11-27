package org.yeodam.plan.controller.clip;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import org.yeodam.plan.model.service.ClipService;
import org.yeodam.plan.model.vo.Clip;

/**
 * Servlet implementation class DeleteClipServlet
 */
@WebServlet(name = "DeleteClip", urlPatterns = { "/deleteClip" })
public class DeleteClipServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteClipServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("deleteClipServlet 들어옴");
		String id = (String)request.getParameter("id");
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("member");
		ClipService service = new ClipService();
		ArrayList<Clip> list = service.deleteClip(memberId,id);
		
		System.out.println("deleteClipServlet list : "+list);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(list,response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
