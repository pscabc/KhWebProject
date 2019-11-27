package org.yeodam.admin.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yeodam.admin.model.service.AdminPhotoService;

/**
 * Servlet implementation class AdminPhotoDeleteServlet
 */
@WebServlet(name = "AdminPhotoDelete", urlPatterns = { "/adminPhotoDelete" })
public class AdminPhotoDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPhotoDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				//1. 인코딩
				request.setCharacterEncoding("UTF-8");
				//2. 변수저장
				int adminPhotoNo = Integer.parseInt(request.getParameter("adminPhotoNo"));
				String adminFilepath = request.getParameter("adminFilepath");
				AdminPhotoService service = new AdminPhotoService();
				int result = service.deleteNotice(adminPhotoNo);
				
				//4. view 처리
				if(result > 0) {
					String saveDirectory = getServletContext().getRealPath("/upload/adminPhoto/");
					File delFile = new File(saveDirectory + adminFilepath);
					delFile.delete();
					if(delFile.exists()) {
						delFile.delete();
					}
				}
				if(result > 0) {
					request.setAttribute("msg", "추천여행지를 삭제 하였습니다.");
					request.setAttribute("loc", "/adminPhotoList");
					RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
					rd.forward(request, response);
				}else {
					request.setAttribute("msg", "추천여행지 삭제를 실패 하였습니다.");
					request.setAttribute("loc", "/adminPhotoList?adminPhotoNo="+adminPhotoNo);
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
