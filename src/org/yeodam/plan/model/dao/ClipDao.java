package org.yeodam.plan.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.yeodam.common.JDBCTemplate;
import org.yeodam.plan.model.vo.Clip;

public class ClipDao {

	public int insertClip(Clip clip, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "insert into clip values(clip_no_seq.nextval,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, clip.getMemberId());
			pstmt.setString(2,clip.getClipTitle());
			pstmt.setString(3, clip.getClipImage());
			pstmt.setString(4, clip.getClipAddr());
			pstmt.setDouble(5, clip.getMapx());
			pstmt.setDouble(6, clip.getMapy());
			pstmt.setString(7, clip.getId());
			pstmt.setString(8, clip.getTypeId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Clip> loadClip(String memberId, Connection conn) {
		ArrayList<Clip> list = new ArrayList<Clip>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from clip where member_id = ? order by clip_no desc";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			while(rset.next()){
				Clip clip = new Clip();
				clip.setClipTitle(rset.getString("clip_title"));
				clip.setClipImage(rset.getString("clip_image"));
				clip.setClipAddr(rset.getString("clip_addr"));
				clip.setMapx(rset.getDouble("mapx"));
				clip.setMapy(rset.getDouble("mapy"));
				clip.setId(rset.getString("id"));
				clip.setTypeId(rset.getString("typeId"));
				
				list.add(clip);
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

	public int searchClip(Connection conn, String id) {
		int count = 0;
		System.out.println("ClipDao - Id : "+id);
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select count(*) as count from clip where id = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		System.out.println("count 조회 결과 : " +count);
		return count;
	}

	public int deleteClip(Connection conn, String memberId, String id) {
		System.out.println("deleteClipDao 들어옴");
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "delete from clip where member_id = ? and id = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		System.out.println("deleteClipDao result : "+result);
		
		return result;
		
	}
}
