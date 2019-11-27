package org.yeodam.admin.model.service;


import java.sql.Connection;
import java.util.ArrayList;

import org.yeodam.admin.model.dao.AdminPhotoDao;
import org.yeodam.admin.model.vo.AdminPageData;
import org.yeodam.admin.model.vo.AdminPhoto;
import org.yeodam.common.JDBCTemplate;

public class AdminPhotoService {

	public int insertNotice(AdminPhoto ap) {
		Connection conn = JDBCTemplate.getConnection();
		AdminPhotoDao dao = new AdminPhotoDao();
		int result = dao.adminInsertNotice(conn,ap);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public AdminPageData selectList(int reqPage) {
		
			Connection conn = JDBCTemplate.getConnection();
			AdminPhotoDao dao = new AdminPhotoDao();

			int numberPage = 3; // 한 페이지당 나타나는 게시물 수!!
			int totalCount = dao.totalCount(conn); // 전체 게시물 수!!!
			System.out.println("totalCount : " + totalCount);
			// 100 -> 10, 101 -> 11, 111-> 12
			// 나머지가 0인경우 -> 몫 , 나머지가 있는경우 -> 몫 +1!!!!!!!!!

			int totalPage = (totalCount % numberPage == 0) ? (totalCount / numberPage) : (totalCount / numberPage + 1);

			System.out.println("totalPage : " + totalPage); // 총 페이지 출력
			// 1 페이지 -> 1번 ~ 10번 2 페이지 -> 11번 ~ 20번!!!!!

			// 글 번호!!!!! 요청 페이지의!!!
			int start = (reqPage - 1) * numberPage + 1;

			// 끝페이지의 마지막 글 번호!!!
			int end = reqPage * numberPage;
			System.out.println("시작 번호 : " + start + "/ 끝 번호 : " + end);

			ArrayList<AdminPhoto> list = dao.selectList(conn, start, end);
			// 배열로 담는 이유

			int pageNaviSize = 4; // 페이지 넘버수
			String pageNavi = ""; // 페이지 네비 HTML을 저장하는 변수!!!

			int pageNo;
			// pageNo 은 해당 페이지 시작번호!!
			// 1 ~ 5 -> 1, 6 ~ 10 -> 6, 11 ~ 15 -> 11
//			int pageNo =((reqPage-1)/pageNaviSize)*pageNaviSize+1;
			if(reqPage<2) {
				pageNo= 1;
			}else {
				pageNo= reqPage-1;
			}
			// 이전버튼생성하기!!!▽
			if (pageNo != 1) {
				pageNavi += "<a class='btn' href='/adminPhotoList?reqPage=+" + (reqPage-1) + "'>이전</a>";
				// 6 7 8 9 10 에서 이전버튼 누르면 5페이지 요청하게 만드는것
			}
			int i = 1;
			// i 를 1부터 증가시키면서 pageNaviSize 만큼 반복문
			// 단, pageNo 가 totalPage 보다 크면 마지막페이지에 도달한것이므로 반복문을 멈춤
			while (!(i++ > pageNaviSize || pageNo > totalPage)) {
				if (reqPage == pageNo) {// 선택된 페이지에서는 하이퍼링크를 걸지 않으려고
					pageNavi += "<span class ='selectPage'>" + pageNo + "</span>";
				} else {
					pageNavi += "<a class='btn' href='/adminPhotoList?reqPage=" + pageNo + "'>" + pageNo + "</a>";
				}
				pageNo++;
			}
			if (pageNo <= totalPage) {
				pageNavi += "<a class='btn' href='/adminPhotoList?reqPage=" + (reqPage+1) + "'>다음</a>";
			}
			AdminPageData apd = new AdminPageData(list, pageNavi); // 리턴타입이 많을경우 객체로 담아서 보내면된다!
														// 또 VO 만들고 사용하면됨!

			JDBCTemplate.close(conn);
			return apd;
		}

	public int updateAdminPhoto(AdminPhoto ap) {
		Connection conn = JDBCTemplate.getConnection();
		AdminPhotoDao dao = new AdminPhotoDao();
		int result = dao.updateAdminPhoto(conn, ap);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<AdminPhoto> selectPhoto() {
		Connection conn = JDBCTemplate.getConnection();
		AdminPhotoDao dao = new AdminPhotoDao();
		ArrayList<AdminPhoto> list = dao.selectPhoto(conn);
		
		if(list != null) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return list;
	}

	public AdminPhoto selectOne(int adminPhotoNo) {
		Connection conn = JDBCTemplate.getConnection();
		AdminPhotoDao dao = new AdminPhotoDao();
		AdminPhoto ap = dao.selectOne(conn,adminPhotoNo);
		if(ap != null) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return ap;
	}

	public int deleteNotice(int adminPhotoNo) {
		Connection conn = JDBCTemplate.getConnection();
		AdminPhotoDao dao = new AdminPhotoDao();
		int result = dao.deleteNotice(conn, adminPhotoNo);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
}
