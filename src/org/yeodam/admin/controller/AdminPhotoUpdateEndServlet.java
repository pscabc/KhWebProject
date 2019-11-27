package org.yeodam.admin.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.yeodam.admin.model.service.AdminPhotoService;
import org.yeodam.admin.model.vo.AdminPhoto;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class AdminPhotoUpdateEndServlet
 */
@WebServlet(name = "AdminPhotoUpdateEnd", urlPatterns = { "/adminPhotoUpdateEnd" })
public class AdminPhotoUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPhotoUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// 1.인코딩
				request.setCharacterEncoding("utf-8");
				// 2.변수저장

				// 3. 비지니스 로직
				// enctype check!!
				if (!ServletFileUpload.isMultipartContent(request)) {
					request.setAttribute("msg", "[enctype] 확인하세요!");
					request.setAttribute("loc", "/");
					RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
					rd.forward(request, response);
					return;
				}

				// 파일 업로드 준비!!!!
				// 1) 파일 업로드 경로 지정하기
				String root = getServletContext().getRealPath("/"); // 실제 서버의 절대 경로를 가져오는것
				String saveDirectory = root + "upload/adminPhoto"; // 경로 지정
				// 2) 파일 최대 크기 지정
				// cos라이브러리 무료 최대 사이즈는 10MB
				int maxSize = 10 * 1024 * 1024; // byte 단위로 줘야되기때문에 곱한것!
				// 3) request -> multipartRequest
				MultipartRequest mRequest = new MultipartRequest(request, saveDirectory, maxSize, "UTF-8", new DefaultFileRenamePolicy());
				// DefaultFileRenamePolicy 파일을 등록 할 때 중복을 방지해 주는것 뒤에 숫자를 1,2,3 붙임
				String adminPhotoContent = mRequest.getParameter("adminPhotoContent");
				int adminPhotoNo= Integer.parseInt(mRequest.getParameter("adminPhotoNo"));
				String adminFilename = mRequest.getOriginalFileName("filename");
				String adminFilepath = mRequest.getFilesystemName("filename"); // 있을수도 있고 없을수도 있음!!!!
				// filename 이 2개인 경우 -> 위에가 실제로 올린파일명 // 아래가 번호가 붙은 파일명

				String status = mRequest.getParameter("status");
				String oldFilename = mRequest.getParameter("oldFilename");
				String oldFilepath = mRequest.getParameter("oldFilepath");

				if (adminFilename != null) { // 새 첨부파일이 있는 경우
					if (oldFilename != null) { // 기존첨부파일이있는경우
						// 기존파일 삭제로직
						File delFile = new File(saveDirectory + "/" + oldFilepath);
						System.out.println(delFile.delete() ? "삭제성공" : "삭제실패"); // 불린형 데이터로 나오기때문에 삭제 실패 성공인지 알 수 있다.

					}
				} else { // 새 첨부파일이 없는 경우
					if (status.equals("stay")) { // old파일 상태 그대로 유지!!!
						adminFilename = oldFilename;
						adminFilepath = oldFilepath;
					} else if (status.equals("delete")) { // old파일을 삭제!!!!!
						File delFile = new File(saveDirectory + "/" + oldFilepath);
						System.out.println(delFile.delete() ? "삭제성공" : "삭제실패"); // 불린형 데이터로 나오기때문에 삭제 실패 성공인지 알 수 있다.
					}

				}
				System.out.println("fileName : " + adminFilename);
				System.out.println("filePath : " + adminFilepath);

				AdminPhoto ap = new AdminPhoto(0, adminPhotoNo, adminPhotoContent, adminFilename, adminFilepath);
				AdminPhotoService service = new AdminPhotoService();
				int result = service.updateAdminPhoto(ap);

				if (result > 0) {
					request.setAttribute("msg", "추천 여행지를 수정하였습니다.");
				} else {
					request.setAttribute("msg", "추천 여행지를 수정을 실패하였습니다.");
				}
				request.setAttribute("loc", "/adminPhotoUpdate?adminPhotoNo=" + adminPhotoNo);
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
