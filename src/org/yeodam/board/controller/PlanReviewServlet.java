package org.yeodam.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yeodam.board.model.service.BoardService;
import org.yeodam.board.model.vo.Board;





/**
 * Servlet implementation class PlanReviewServlet
 */
@WebServlet(name = "PlanReview", urlPatterns = { "/planReview" })
public class PlanReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				//1.인코딩
				request.setCharacterEncoding("utf-8");
				//2.변수저장
				String memberId = request.getParameter("memberId");
				//3.비지니스로직
				BoardService service = new BoardService();
				ArrayList<Board> b = service.selectList(memberId);
				//4.뷰
				if(b!=null) {
					request.setAttribute("boardList", b);
					RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/board/planReview.jsp");
					rd.forward(request, response);
				}else {
					response.sendRedirect("/");
					
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
