package org.yeodam.plan.model.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.yeodam.common.JDBCTemplate;
import org.yeodam.plan.model.dao.ClipDao;
import org.yeodam.plan.model.vo.Clip;

public class ClipService {
	
	
	public int insertClip(Clip clip){
		int count = 0;
		int result = 0;
		System.out.println("inserClipService - typeId : "+clip.getTypeId());
		Connection conn = JDBCTemplate.getConnection();
		ClipDao dao = new ClipDao();
		//조회를 먼저 해보고 없으면 추가
		count = dao.searchClip(conn,clip.getId());
		
		if(count == 0) {
			result = dao.insertClip(clip,conn);
			
			if(result>0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
		}
		
		return count;
	}

	public ArrayList<Clip> loadClip(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		ClipDao dao = new ClipDao();
		ArrayList<Clip> list = dao.loadClip(memberId,conn);
		
		if(list != null) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		return list;
	}

	public ArrayList<Clip> deleteClip(String memberId, String id) {
		System.out.println("deleteClipService 들어옴");
		//clip 삭제 및 조회
		int result = 0;
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Clip> list = new ArrayList<Clip>();
		//1.delete
		ClipDao dao = new ClipDao();
		result = dao.deleteClip(conn,memberId,id);
		
		if(result > 0) {//삭제 성공
		//2.select
			list = dao.loadClip(memberId,conn);
			if(list != null) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
		}else {
			//삭제 실패
		}
	System.out.println("deleteClipDao list : "+list);
		return list;
	}
}
