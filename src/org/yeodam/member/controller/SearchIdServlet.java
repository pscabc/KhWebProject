package org.yeodam.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yeodam.member.model.service.MemberService;
import org.yeodam.member.model.vo.Member;

/**
 * Servlet implementation class SearchIdServlet
 */
@WebServlet(name = "SearchId", urlPatterns = { "/searchId" })
public class SearchIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//2.변수저장
		String memberName = request.getParameter("memberName");
		System.out.println(memberName);
		String email = request.getParameter("email");
		System.out.println(email);
		//3.비지니스 로직
		MemberService service = new MemberService();
		String memberId = service.searchId(memberName, email);
		
		//4.뷰
		if(memberId!=null) {
			//찾음
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "아이디는 " + memberId + " 입니다.");
			request.setAttribute("loc", "/views/member/searchIdPw.jsp");
			rd.forward(request, response);
		}else {
			//못찾음
			RequestDispatcher rd = request.getRequestDispatcher("/");
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
