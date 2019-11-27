package org.yeodam.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import org.yeodam.board.model.vo.Board;
import org.yeodam.common.JDBCTemplate;



public class BoardDao {

	//썻던 계획 보여주기
	public ArrayList<Board> selectList(Connection conn, String memberId) {
		ArrayList<Board> list = new ArrayList<Board>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query="select * from board where member_id=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Board b = new Board();
				b.setBoardNo(rset.getInt("board_no"));
				b.setMemberId(rset.getString("member_id"));
				b.setBoardContent(rset.getString("board_content"));
				b.setFilename(rset.getString("filename"));
				b.setFilepath(rset.getString("filepath"));
				b.setBoardDate(rset.getDate("board_date"));
				b.setReadCount(rset.getInt("readcount"));
				b.setBoardTitle(rset.getString("board_title"));
				list.add(b);
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
