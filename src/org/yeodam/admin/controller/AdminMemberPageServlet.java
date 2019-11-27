package org.yeodam.admin.controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yeodam.admin.model.service.AdminMemberService;
import org.yeodam.admin.model.vo.AdminMemberPageData;





/**
 * Servlet implementation class AdminMemberPageServlet
 */
@WebServlet(name = "AdminMemberPage", urlPatterns = { "/adminMemberPage" })
public class AdminMemberPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");

		int reqPage;	//페이지!
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e) {
			reqPage = 1;
		}
		//3.비지니스로직
		AdminMemberService service = new AdminMemberService();
		AdminMemberPageData ampd = service.selectList(reqPage);
		
		//4.뷰 처리
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/adminMember/adminMemberPage.jsp");
		request.setAttribute("ampd", ampd);
		request.setAttribute("list", ampd.getList());
		request.setAttribute("pageNavi", ampd.getPageNavi());
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
