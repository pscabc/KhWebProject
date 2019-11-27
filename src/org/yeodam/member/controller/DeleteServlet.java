package org.yeodam.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.yeodam.member.model.service.MemberService;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet(name = "Delete", urlPatterns = { "/delete" })
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("엥");
		String memberId = request.getParameter("memberId");
		
		
		MemberService service = new MemberService();
		int result = service.delete(memberId);
		if(result>0) {
			HttpSession session = request.getSession(false);
			if(session != null) {
				session.invalidate();
			}
			request.setAttribute("msg", "삭제 성공");
			request.setAttribute("loc", "/");
			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			rd.forward(request, response);
		}else {
			request.setAttribute("msg", "삭제 실패");
			request.setAttribute("loc", "/");
			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
