package org.yeodam.admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import org.yeodam.common.JDBCTemplate;
import org.yeodam.member.model.vo.Member;

public class AdminMemberDao {

	public ArrayList<Member> selectList(Connection conn , int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query =  "select * from (select ROWNUM as rnum, n. * from (select * from member order by member_name asc) n) where rnum between ? and ? ";
		ArrayList<Member> list = new ArrayList<Member>();
		Member m = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				m = new Member();
				m.setRnum(rset.getInt("rnum"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberAge(rset.getInt("member_age"));
				m.setEmail(rset.getString("email"));
				m.setEnrollDate(rset.getDate("enroll_date"));
				m.setFilename(rset.getString("filename"));
				m.setFilepath(rset.getString("filepath"));
				m.setGender(rset.getString("gender"));
				m.setIntro(rset.getString("intro"));
				m.setPhone(rset.getString("phone"));
				list.add(m);
			} 
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int totalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select count(*) as total from member";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("total"); // 안에 컬럼명!! 위에 커리문에서 total 로 쓴것!!!!!!!
												// as를 사용하지 않으면 count(*) 로 컬럼명이 생김!!
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int memberDelete(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query="delete from member where member_id=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Member> searchKeywordId(Connection conn, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from member where member_id=?"; 
		ArrayList<Member> list = new ArrayList<Member>();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,keyword);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Member m = new Member();
				m.setMemberId(rset.getString("member_id")); 
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberName(rset.getString("member_name"));				
				m.setEmail(rset.getString("email"));
				m.setPhone(rset.getString("phone"));
				m.setGender(rset.getString("gender"));
				m.setEnrollDate(rset.getDate("enroll_date"));
				m.setIntro(rset.getString("intro"));
				m.setFilename(rset.getString("filename"));
				m.setFilepath(rset.getString("filepath"));
				m.setMemberAge(rset.getInt("member_age"));
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
			
		}
		return list;
	}

	public ArrayList<Member> searchKeywordName(Connection conn, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from member where member_name like (?)"; 
		ArrayList<Member> list = new ArrayList<Member>();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,"%"+keyword+"%");
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Member m = new Member();;
				m.setMemberId(rset.getString("member_id")); 
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberName(rset.getString("member_name"));				
				m.setEmail(rset.getString("email"));
				m.setPhone(rset.getString("phone"));
				m.setGender(rset.getString("gender"));
				m.setEnrollDate(rset.getDate("enroll_date"));
				m.setIntro(rset.getString("intro"));
				m.setFilename(rset.getString("filename"));
				m.setFilepath(rset.getString("filepath"));
				m.setMemberAge(rset.getInt("member_age"));
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
			
		}
		return list;
	}
}
