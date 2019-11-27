package org.yeodam.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.yeodam.admin.model.service.AdminPhotoService;
import org.yeodam.admin.model.vo.AdminPhoto;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class AdminInsertPhotoServlet
 */
@WebServlet(name = "AdminInsertPhoto", urlPatterns = { "/adminInsertPhoto" })
public class AdminInsertPhotoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInsertPhotoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		request.setCharacterEncoding("UTF-8");
		//2. enctype check!
		HttpSession session = request.getSession(false);
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "[enctype]확인해야됨!!!!!");
			request.setAttribute("loc", "/");
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			rd.forward(request, response);
			return;
		}
		
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root + "upload/adminPhoto";
				
		//2) 파일 최대 크기 지정!!!
		//cos라이브러리 무료 최대 사이즈는 10MB
		int maxSize = 10*1024*1024;
		
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory, maxSize, "UTF-8", new DefaultFileRenamePolicy());

		String adminPhotoContent = mRequest.getParameter("adminPhotoContent");
		String filename = mRequest.getOriginalFileName("filename");
		String filepath = mRequest.getFilesystemName("filename");
		
		AdminPhoto ap = new AdminPhoto(0,0,adminPhotoContent, filename, filepath);
		AdminPhotoService service = new AdminPhotoService();
		int result = service.insertNotice(ap);
		
		if(result > 0){
			request.setAttribute("msg", "게시물이 등록되었습니다!");
		}else {
			request.setAttribute("msg", "게시물이 등록되지 않았습니다!");
		}
		request.setAttribute("loc", "/adminPhotoList");
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
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
