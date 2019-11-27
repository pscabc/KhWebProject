package org.yeodam.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yeodam.admin.model.service.AdminPhotoService;
import org.yeodam.admin.model.vo.AdminPageData;
import org.yeodam.admin.model.vo.AdminPhoto;

/**
 * Servlet implementation class MainViewServlet
 */
@WebServlet(name = "MainView", urlPatterns = { "/mainView" })
public class MainViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		//비지니스로직
		AdminPhotoService service = new AdminPhotoService();
		ArrayList<AdminPhoto> list = service.selectPhoto();
		//4.뷰 처리
		RequestDispatcher rd = request.getRequestDispatcher("view.jsp");
		request.setAttribute("list", list);
		request.setAttribute("loc", "view.jsp");
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
