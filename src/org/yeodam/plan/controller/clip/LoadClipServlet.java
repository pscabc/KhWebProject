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

import org.yeodam.member.model.vo.Member;
import org.yeodam.plan.model.service.ClipService;
import org.yeodam.plan.model.vo.Clip;

/**
 * Servlet implementation class LoadClipServlet
 */
@WebServlet(name = "loadClip", urlPatterns = { "/loadClip" })
public class LoadClipServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadClipServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ClipService service = new ClipService();
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		System.out.println("로그인 된 아이디 : "+member.getMemberId());
		ArrayList<Clip> list = service.loadClip(member.getMemberId());
		
		
		response.setContentType("aplication/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
