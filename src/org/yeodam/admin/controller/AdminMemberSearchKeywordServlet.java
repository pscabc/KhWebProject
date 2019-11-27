package org.yeodam.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yeodam.admin.model.service.AdminMemberService;
import org.yeodam.member.model.vo.Member;

/**
 * Servlet implementation class AdminMemberSearchKeywordServlet
 */
@WebServlet(name = "AdminMemberSearchKeyword", urlPatterns = { "/adminMemberSearchKeyword" })
public class AdminMemberSearchKeywordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberSearchKeywordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
				
				request.setCharacterEncoding("utf-8");
				String type = request.getParameter("type");
				String keyword = request.getParameter("keyword");
	
				AdminMemberService service = new AdminMemberService();
				ArrayList<Member> list = service.searchKeyword(type,keyword);
				//
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/adminMember/adminMemberSearchView.jsp");
				request.setAttribute("memberList", list);
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
