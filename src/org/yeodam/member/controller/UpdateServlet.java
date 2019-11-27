package org.yeodam.member.controller;

import java.io.IOException;
import java.sql.Date;

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
 * Servlet implementation class UpdateServlet
 */
@WebServlet(name = "Update", urlPatterns = { "/update" })
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
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
		HttpSession session = request.getSession(false);
		
		String id = request.getParameter("memberId");
		String pw = request.getParameter("memberPw");
		String name = request.getParameter("memberName");
		int	age = Integer.parseInt(request.getParameter("memberAge"));
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String intro = request.getParameter("intro");
		String phone = request.getParameter("phone");
			
		Member member = new Member(0, id, pw, name, age, email, null, null, null, gender, intro, phone);
		
		//3.비지니스로직
		MemberService service = new MemberService();
		int result = service.update(member);
		
		//4.뷰
		if(result>0) {
			Member member2 = service.selectOne(id);
			//request.setAttribute("member", member2);
			session.setAttribute("member", member2);
			//RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/member/mypage.jsp");
			//rd.forward(request, response);
			response.sendRedirect("/mypage?memberId="+id+"&status=1");
		}else {
			request.setAttribute("msg", "수정 실패");
			request.setAttribute("loc", "/mypage?memberId="+ id);
	
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

	public static void main(String[] args) {
		try {
			String testStr = null;
			System.out.println(Integer.parseInt(testStr));
		}catch(Exception e) {
			System.out.println(e);
		}
	}
}
