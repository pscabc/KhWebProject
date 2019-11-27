package org.yeodam.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import org.yeodam.common.JDBCTemplate;
import org.yeodam.member.model.dao.MemberDao;
import org.yeodam.member.model.vo.Member;



public class MemberService {

	//로그인
	public Member login(String memberId, String memberPw) {
		Connection conn = JDBCTemplate.getConnection();
		MemberDao dao = new MemberDao();
		Member m = dao.login(conn, memberId, memberPw);
		JDBCTemplate.close(conn);
		return m;
	}
	
	//마이페이지
	public Member selectOne(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		MemberDao dao = new MemberDao();
		Member m = dao.selectOne(conn, memberId);
		JDBCTemplate.close(conn);
		return m;
	}
	
	//수정
	public int update(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		MemberDao dao = new MemberDao();
		int result = dao.update(conn, m);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	//삭제
	public int delete(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		MemberDao dao = new MemberDao();
		int result = dao.delete(conn, memberId);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	//가입
	public int insertMember(Member m) {
	      Connection conn = JDBCTemplate.getConnection();
	      MemberDao dao = new MemberDao();
	      int result  = dao.insertMember(conn, m);
	      
	      JDBCTemplate.close(conn);
	      return result;
	}
	
	//회원목록
	public ArrayList<Member> selectList(){
		Connection conn = JDBCTemplate.getConnection();
		MemberDao dao = new MemberDao();
		ArrayList<Member> list = dao.selectList(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	
	//아이디찾기
	public String searchId(String memberName, String email) {
		Connection conn = JDBCTemplate.getConnection();
		MemberDao dao = new MemberDao();
		String memberId = dao.searchId(conn, memberName, email);
		JDBCTemplate.close(conn);
		return memberId;
	}
	
	//비밀번호찾기
	public Member searchPw(String memberId, String memberName, String email) {
		Connection conn = JDBCTemplate.getConnection();
		MemberDao dao = new MemberDao();
		Member m = dao.searchPw(conn,memberId, memberName, email);
		JDBCTemplate.close(conn);
		return m;
	}
}
