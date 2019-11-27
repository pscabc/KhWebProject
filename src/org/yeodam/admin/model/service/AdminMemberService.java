package org.yeodam.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import org.yeodam.admin.model.dao.AdminMemberDao;
import org.yeodam.admin.model.vo.AdminMemberPageData;
import org.yeodam.common.JDBCTemplate;
import org.yeodam.member.model.vo.Member;

public class AdminMemberService {

	public AdminMemberPageData selectList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		AdminMemberDao dao = new AdminMemberDao();
		int numberPage = 10; // 한 페이지당 나타나는 게시물 수!!
		int totalCount = dao.totalCount(conn);	//전체 게시물 수!
		System.out.println("totalCount :" + totalCount);
		//100 -> 10, 101-> 11, 111 ->12		
		//나머지가 0인경우 -> 몫 , 나머지가 있는경우 -> 몫+1
		
		int totalPage 
		= (totalCount%numberPage ==0)?(totalCount/numberPage):(totalCount/numberPage)+1; //삼항연산자!	
		
		System.out.println("totalPage :" + totalPage); 	//총 페이지 출력
		//1 page -> 1번글 ~ 10번글, 2page -> 11번 글 ~ 20번 글
		
		//시작페이지 start
		int start = (reqPage-1)*numberPage+1;
		//끝 페이지 end
		int end = reqPage*numberPage;
		System.out.println("시작번호 : " + start +"/ 끝 번호 : "+ end);
		ArrayList<Member> list = dao.selectList(conn, start, end);
		
		//페이지 네비게이션 생성!!
		int pageNaviSize = 5; //페이지 넘버수
		String pageNavi = ""; //페이지 네비 HTML을 저장하는 변수!
		int pageNo;
		// pageNo 은 해당 페이지 시작번호!!
		// 1 ~ 5 -> 1, 6 ~ 10 -> 6, 11 ~ 15 -> 11
//		int pageNo =((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(reqPage<3) {
			pageNo= 1;
		}else {
			pageNo= reqPage-2;
		}
		
		//이전버튼생성하기!!!▽
		if(pageNo != 1) {
			pageNavi += "<a class='btn' href='/adminMemberPage?reqPage=+"+(reqPage-1)+"'>이전</a>"; 
			// 6 7 8 9 10 에서 이전버튼 누르면 5페이지 요청하게 만드는것
		}
		int i = 1;
		//i를 1부터 증가시키면서 pageNaviSize만큼 반복문
		//단, pageNo 가 totalPage보다 크면 마지막페이지에 도달한것이므로 반복문을 멈춤
		while(! (i++>pageNaviSize || pageNo>totalPage)) {
			if(reqPage == pageNo) {//선택된 페이지에서는 하이퍼링크를 걸지 않으려고 
				pageNavi +="<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi +="<a class='btn' href='/adminMemberPage?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class = 'btn' href='/adminMemberPage?reqPage="+(reqPage+1)+"'>다음</a>";
		}
		AdminMemberPageData ampd = new AdminMemberPageData(pageNavi, list); // 리턴타입이 많을경우 객체로 담아서 보내면된다! 
																			//또 VO 만들고 사용하면됨!
		JDBCTemplate.close(conn);
		return ampd;
	}

	public int memberDelete(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		AdminMemberDao dao = new AdminMemberDao();
		int result = dao.memberDelete(conn, memberId);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<Member> searchKeyword(String type, String keyword) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = null;
		AdminMemberDao dao = new AdminMemberDao();
		switch(type) {
		case "memberId" : list = dao.searchKeywordId(conn,keyword); break;
		case "memberName" : list = dao.searchKeywordName(conn,keyword); break;
		}
		JDBCTemplate.close(conn);
		return list;
	}
}
