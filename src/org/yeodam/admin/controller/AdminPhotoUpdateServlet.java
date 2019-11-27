package org.yeodam.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yeodam.admin.model.service.AdminPhotoService;
import org.yeodam.admin.model.vo.AdminPhoto;

/**
 * Servlet implementation class AdminPhotoUpdateServlet
 */
@WebServlet(name = "AdminPhotoUpdate", urlPatterns = { "/adminPhotoUpdate" })
public class AdminPhotoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPhotoUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩
		request.setCharacterEncoding("utf-8");
		//변수저장
		int adminPhotoNo = Integer.parseInt(request.getParameter("adminPhotoNo"));
		//3. 비지니스로직
		System.out.println(adminPhotoNo);
		
		AdminPhotoService service = new AdminPhotoService();
		AdminPhoto ap = service.selectOne(adminPhotoNo);
		
		
		
		if(ap != null) {
			request.setAttribute("ap", ap);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/adminPhoto/adminPhotoUpdate.jsp");
			rd.forward(request, response);
		}else {
			request.setAttribute("msg", "수정을 실패 했습니다.");
			request.setAttribute("loc", "/adminPhotoUpdate");
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
