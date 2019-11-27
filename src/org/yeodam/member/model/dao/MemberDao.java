package org.yeodam.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.yeodam.common.JDBCTemplate;
import org.yeodam.member.model.vo.Member;

public class MemberDao {
	public Member login(Connection conn, String memberId, String memberPw) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query="select * from member where member_id=? and member_pw=?";
				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, memberId);
					pstmt.setString(2, memberPw);
					rset = pstmt.executeQuery();
					if(rset.next()) {
						m = new Member();
						m.setMemberId(rset.getString("member_id"));
						m.setMemberPw(rset.getString("member_pw"));
						m.setMemberName(rset.getString("member_name"));
						m.setMemberAge(rset.getInt("member_age"));
						m.setEmail(rset.getString("email"));
						m.setGender(rset.getString("gender"));
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					JDBCTemplate.close(rset);
					JDBCTemplate.close(pstmt);
				}
				return m;
	}
	
	public Member selectOne(Connection conn, String memberId) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query="select * from member where member_id=?";
				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, memberId);
					rset = pstmt.executeQuery();
					if(rset.next()) {
						m = new Member();
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
				}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					JDBCTemplate.close(rset);
					JDBCTemplate.close(pstmt);
				}
				return m;
	}
	
	//수정
	public int update(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query="update member set member_pw = ?, member_name=?, "
				+ "member_age=?, email=?, gender=?,intro=?,phone=?"
				+ " where member_id = ?";
		try {
			pstmt = conn.prepareStatement(query);			
			pstmt.setString(1, m.getMemberPw());
			pstmt.setString(2, m.getMemberName());
			pstmt.setInt(3, m.getMemberAge());
			pstmt.setString(4, m.getEmail());			
			pstmt.setString(5, m.getGender());
			pstmt.setString(6, m.getIntro());
			pstmt.setString(7, m.getPhone());
			pstmt.setString(8, m.getMemberId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	//삭제
	public int delete(Connection conn, String memberId) {
		int result = 0;
		PreparedStatement pstmt = null;
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
	
	//회원가입
	public int insertMember(Connection conn, Member m) {
	      int result = 0;
	      PreparedStatement pstmt =null;
	      String query = "insert into member values(?,?,?,?,?,sysdate,?,?,?,?,?)";
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setString(1, m.getMemberId());
	         pstmt.setString(2, m.getMemberPw());
	         pstmt.setString(3, m.getMemberName());
	         pstmt.setInt(4, m.getMemberAge());
	         pstmt.setString(5, m.getEmail());
	         pstmt.setString(6, m.getFilename());
	         pstmt.setString(7, m.getFilepath());
	         pstmt.setString(8, m.getGender());
	         pstmt.setString(9, m.getIntro());
	         pstmt.setString(10, m.getPhone());
	         
	         result = pstmt.executeUpdate();
	         if (result > 0) {
	            conn.commit();
	         } else {
	            conn.rollback();
	         }
	         } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally {
	         JDBCTemplate.close(pstmt);
	         
	      }
	      return result;
	      
	   }
	   
	//회원목록
	public ArrayList<Member> selectList(Connection conn){
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query="select * from member";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Member m = new Member();
				m.setMemberAge(rset.getInt("age"));
				m.setEmail(rset.getString("email"));
				m.setEnrollDate(rset.getDate("enroll_date"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setGender(rset.getString("gender"));
				m.setFilename(rset.getString("filename"));
				m.setFilepath(rset.getString("filepath"));
				m.setIntro(rset.getString("intro"));
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
	
	//아이디검색
	public ArrayList<Member> searchKeywordId(Connection conn, String keyword){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query="select * from member where member_id = ?";
		ArrayList<Member> list = new ArrayList<Member>();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, keyword);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Member m = new Member();
				m.setMemberAge(rset.getInt("age"));
				m.setEmail(rset.getString("email"));
				m.setEnrollDate(rset.getDate("enroll_date"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setGender(rset.getString("gender"));					
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
	
	//이름검색
		public ArrayList<Member> searchKeywordName(Connection conn, String keyword){
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String query="select * from member where member_name like (?)";
			ArrayList<Member> list = new ArrayList<Member>();
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, "%"+keyword+"%");
				rset = pstmt.executeQuery();
				while(rset.next()) {
					Member m = new Member();
					m.setMemberAge(rset.getInt("age"));
					m.setEmail(rset.getString("email"));
					m.setEnrollDate(rset.getDate("enroll_date"));
					m.setMemberId(rset.getString("member_id"));
					m.setMemberName(rset.getString("member_name"));
					m.setMemberPw(rset.getString("member_pw"));
					m.setGender(rset.getString("gender"));
											
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
		
		//아이디찾기
	public String searchId(Connection conn, String memberName, String email) {
		String memberId = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query="select member_id from member where member_Name=? and email=?";
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, memberName);
				pstmt.setString(2, email);
				rset = pstmt.executeQuery();
				if(rset.next()) {
					memberId= rset.getString("member_id");
					System.out.println("여기는다오"+memberId);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			System.out.println("여기는다오"+memberId);
		return memberId;
	}
	
	//비밀번호찾기
	public Member searchPw(Connection conn, String memberId, String memberName, String email) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query="select * from member where member_id=? and member_name=? and email=?";
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, memberId);
				pstmt.setString(2, memberName);
				pstmt.setString(3, email);
				rset = pstmt.executeQuery();
				if(rset.next()) {
					m = new Member();
					m.setMemberAge(rset.getInt("age"));
					m.setEmail(rset.getString("email"));
					m.setEnrollDate(rset.getDate("enroll_date"));
					m.setMemberId(rset.getString("member_id"));
					m.setMemberName(rset.getString("member_name"));
					m.setMemberPw(rset.getString("member_pw"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
		return m;
	}
}
