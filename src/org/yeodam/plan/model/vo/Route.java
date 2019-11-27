package org.yeodam.plan.model.vo;

import java.sql.Date;

public class Route {
	int planNo;
	String planTitle;
	int routeNo;
	int tourNo;
	String routeAddr;
	String routeName;
	Date routeDate;
	double routeMapx;
	double routeMapy;
	String filename;
	String filepath;
	String routeImg;
	String memberId;
	public Route() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Route(int planNo, String planTitle, int routeNo, int tourNo, String routeAddr, String routeName,
			Date routeDate, double routeMapx, double routeMapy, String filename, String filepath, String routeImg,
			String memberId) {
		super();
		this.planNo = planNo;
		this.planTitle = planTitle;
		this.routeNo = routeNo;
		this.tourNo = tourNo;
		this.routeAddr = routeAddr;
		this.routeName = routeName;
		this.routeDate = routeDate;
		this.routeMapx = routeMapx;
		this.routeMapy = routeMapy;
		this.filename = filename;
		this.filepath = filepath;
		this.routeImg = routeImg;
		this.memberId = memberId;
	}
	public int getPlanNo() {
		return planNo;
	}
	public void setPlanNo(int planNo) {
		this.planNo = planNo;
	}
	public String getPlanTitle() {
		return planTitle;
	}
	public void setPlanTitle(String planTitle) {
		this.planTitle = planTitle;
	}
	public int getRouteNo() {
		return routeNo;
	}
	public void setRouteNo(int routeNo) {
		this.routeNo = routeNo;
	}
	public int getTourNo() {
		return tourNo;
	}
	public void setTourNo(int tourNo) {
		this.tourNo = tourNo;
	}
	public String getRouteAddr() {
		return routeAddr;
	}
	public void setRouteAddr(String routeAddr) {
		this.routeAddr = routeAddr;
	}
	public String getRouteName() {
		return routeName;
	}
	public void setRouteName(String routeName) {
		this.routeName = routeName;
	}
	public Date getRouteDate() {
		return routeDate;
	}
	public void setRouteDate(Date routeDate) {
		this.routeDate = routeDate;
	}
	public double getRouteMapx() {
		return routeMapx;
	}
	public void setRouteMapx(double routeMapx) {
		this.routeMapx = routeMapx;
	}
	public double getRouteMapy() {
		return routeMapy;
	}
	public void setRouteMapy(double routeMapy) {
		this.routeMapy = routeMapy;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getRouteImg() {
		return routeImg;
	}
	public void setRouteImg(String routeImg) {
		this.routeImg = routeImg;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	
}
