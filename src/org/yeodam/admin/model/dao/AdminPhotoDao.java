package org.yeodam.admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.yeodam.admin.model.vo.AdminPhoto;
import org.yeodam.common.JDBCTemplate;

public class AdminPhotoDao {

	public int adminInsertNotice(Connection conn, AdminPhoto ap) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into admin values(seq_adminphoto_no.nextval,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, ap.getAdminPhotoContent());
			pstmt.setString(2, ap.getAdminFilename());
			pstmt.setString(3, ap.getAdminFilepath());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<AdminPhoto> selectList(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;											// admin 뒤에 order by adminphoto_no desc
		String query = "select * from (select ROWNUM as rnum, n. * from (select * from admin) n) where rnum between ? and ? ";
		ArrayList<AdminPhoto> list = new ArrayList<AdminPhoto>();
		AdminPhoto ap = null;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				ap = new AdminPhoto();
				ap.setRnum(rset.getInt("rnum"));
				ap.setAdminPhotoNo(rset.getInt("adminphoto_no"));
				ap.setAdminFilename(rset.getString("filename"));
				ap.setAdminFilepath(rset.getString("filepath"));
				ap.setAdminPhotoContent(rset.getString("adminphoto_content"));
				list.add(ap);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}

	public int totalCount(Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select count(*) as total from admin";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = rset.getInt("total"); // 쿼리문을 실행하면 한개의 컬럼에 total 이라고 나오고 전체 갯수 나옴!!!!!!
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateAdminPhoto(Connection conn, AdminPhoto ap) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update admin set adminphoto_content=?, filepath=?, filename=? where adminphoto_no=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, ap.getAdminPhotoContent());
			pstmt.setString(2, ap.getAdminFilepath());
			pstmt.setString(3, ap.getAdminFilename());
			pstmt.setInt(4, ap.getAdminPhotoNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
		
	}

	public ArrayList<AdminPhoto> selectPhoto(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select filename from admin";
		ArrayList<AdminPhoto> list = new ArrayList<AdminPhoto>();
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				AdminPhoto ap = new AdminPhoto();
				ap.setAdminFilename(rset.getString("filename"));
				list.add(ap);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
	
		return list;
	}

	public AdminPhoto selectOne(Connection conn, int adminPhotoNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from admin where adminphoto_no=?";
		AdminPhoto ap = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, adminPhotoNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ap = new AdminPhoto();
				ap.setAdminFilename(rset.getString("filename"));
				ap.setAdminPhotoContent(rset.getString("adminphoto_content"));
				ap.setAdminPhotoNo(rset.getInt("adminphoto_no"));
				ap.setAdminFilepath("filepath");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return ap;
	}

	public int deleteNotice(Connection conn, int adminPhotoNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from admin where adminphoto_no=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, adminPhotoNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
}

