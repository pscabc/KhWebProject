package org.yeodam.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.yeodam.member.model.service.MemberService;
import org.yeodam.member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "Login", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("로그인 Servlet 시작");
		//1.인코딩
		request.setCharacterEncoding("utf-8");
		//2.변수저장
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		//3.비지니스로직처리
		MemberService service = new MemberService();
		Member m = service.login(memberId, memberPw);
		//4.view처리
		if(m!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", m);
			request.setAttribute("msg", "로그인성공");
		}else {
			request.setAttribute("msg", "로그인실패");
		}
		request.setAttribute("loc", "/index.jsp");
		//-> 로그인이 성공하든 실패하든 index.jsp 페이지로 이동하겠다.
		
		//-> 경로로 페이지 이동 -> url에 msg.jsp가 안뜨고 지정한 서블렛이름이 뜬다 !! (login)
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		rd.forward(request, response);
		System.out.println("로그인 servlet끝");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
