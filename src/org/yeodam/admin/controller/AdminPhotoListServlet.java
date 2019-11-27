package org.yeodam.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yeodam.admin.model.service.AdminPhotoService;
import org.yeodam.admin.model.vo.AdminPageData;

/**
 * Servlet implementation class AdminPhotoListServlet
 */
@WebServlet(name = "adminPhotoList", urlPatterns = { "/adminPhotoList" })
public class AdminPhotoListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPhotoListServlet() {
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
				AdminPhotoService service = new AdminPhotoService();
				AdminPageData apd = service.selectList(reqPage);
				
				//4.뷰 처리
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/adminPhoto/adminPhotoList.jsp");
				request.setAttribute("apd", apd);
				request.setAttribute("list", apd.getList());
				request.setAttribute("pageNavi", apd.getPageNavi());
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
