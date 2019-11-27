package org.yeodam.admin.model.vo;

import java.util.ArrayList;

public class AdminPageData {
	private ArrayList<AdminPhoto> list;
	private String pageNavi;
	public AdminPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminPageData(ArrayList<AdminPhoto> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<AdminPhoto> getList() {
		return list;
	}
	public void setList(ArrayList<AdminPhoto> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
