package org.yeodam.plan.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.yeodam.common.JDBCTemplate;
import org.yeodam.plan.model.vo.Route;

public class RouteDao {

	public int insertRoute(Connection conn, Route route) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String query = "insert into route values(ROUTE_PK_NO_SEQ.NEXTVAL,?, sysdate,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, route.getPlanNo());
			pstmt.setString(2, route.getPlanTitle());
			pstmt.setInt(3, route.getRouteNo());
			pstmt.setInt(4, route.getTourNo());
			pstmt.setString(5, route.getRouteAddr());
			pstmt.setString(6, route.getRouteName());
			pstmt.setDate(7, route.getRouteDate());
			pstmt.setDouble(8, route.getRouteMapx());
			pstmt.setDouble(9, route.getRouteMapy());
			pstmt.setString(10, route.getFilename());
			pstmt.setString(11, route.getFilepath());
			pstmt.setString(12, route.getRouteImg());
			pstmt.setString(13, route.getMemberId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int checkPlanNo(Connection conn) {
		int max = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select max(plan_no) as max from route";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()){
				max = rset.getInt("max");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return max;
	}

}
