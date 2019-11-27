package org.yeodam.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import org.yeodam.board.model.dao.BoardDao;
import org.yeodam.board.model.vo.Board;
import org.yeodam.common.JDBCTemplate;



public class BoardService {

	public ArrayList<Board> selectList(String memId) {
		Connection conn = JDBCTemplate.getConnection();
		BoardDao bd = new BoardDao();
		ArrayList<Board> list = bd.selectList(conn, memId);
		JDBCTemplate.close(conn);
		return list;
	}

}
