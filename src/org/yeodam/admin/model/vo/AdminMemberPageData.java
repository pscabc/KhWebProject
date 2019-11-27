package org.yeodam.admin.model.vo;

import java.util.ArrayList;

import org.yeodam.member.model.vo.Member;

public class AdminMemberPageData {
	private String pageNavi;
	private ArrayList<Member> list;
	public AdminMemberPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminMemberPageData(String pageNavi, ArrayList<Member> list) {
		super();
		this.pageNavi = pageNavi;
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	public ArrayList<Member> getList() {
		return list;
	}
	public void setList(ArrayList<Member> list) {
		this.list = list;
	}
}
