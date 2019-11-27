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
 * Servlet implementation class JoinServlet
 */
@WebServlet(name = "Join", urlPatterns = { "/join" })
public class JoinServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //1. 인코딩
      request.setCharacterEncoding("utf-8");
      //2. 변수저장 
      
      String memberId = request.getParameter("memberId");
      String memberPw = request.getParameter("memberPw");
      String memberName =request.getParameter("memberName");
      int memberAge = Integer.parseInt(request.getParameter("memberAge"));
      String email = request.getParameter("email");
      String filename = request.getParameter("filename");
      String filepath = request.getParameter("filepath");
      String gender = request.getParameter("gender");
      String intro = request.getParameter("intro");
      String phone = request.getParameter("phone");
     
     
      Member m = new Member(0, memberId, memberPw, memberName, memberAge, phone, email, null, filename, filepath, gender, intro);
      //3. 비지니스로직
      MemberService service = new MemberService();
      int result = service.insertMember(m);
      //4. view처리 
      //성공실패 띄어주기 
      if(result>0) {
         request.setAttribute("msg", "회원가입 성공");
      }else {
         request.setAttribute("msg", "회원가입 실패");
      }
      request.setAttribute("loc", "/");
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