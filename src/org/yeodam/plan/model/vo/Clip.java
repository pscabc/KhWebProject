package org.yeodam.plan.model.vo;

public class Clip {
	String memberId;
	String clipTitle;
	String clipImage;
	String clipAddr;
	double mapx;
	double mapy;
	String id;
	String typeId;
	public Clip() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Clip(String memberId, String clipTitle, String clipImage, String clipAddr, double mapx, double mapy,
			String id, String typeId) {
		super();
		this.memberId = memberId;
		this.clipTitle = clipTitle;
		this.clipImage = clipImage;
		this.clipAddr = clipAddr;
		this.mapx = mapx;
		this.mapy = mapy;
		this.id = id;
		this.typeId = typeId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getClipTitle() {
		return clipTitle;
	}
	public void setClipTitle(String clipTitle) {
		this.clipTitle = clipTitle;
	}
	public String getClipImage() {
		return clipImage;
	}
	public void setClipImage(String clipImage) {
		this.clipImage = clipImage;
	}
	public String getClipAddr() {
		return clipAddr;
	}
	public void setClipAddr(String clipAddr) {
		this.clipAddr = clipAddr;
	}
	public double getMapx() {
		return mapx;
	}
	public void setMapx(double mapx) {
		this.mapx = mapx;
	}
	public double getMapy() {
		return mapy;
	}
	public void setMapy(double mapy) {
		this.mapy = mapy;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTypeId() {
		return typeId;
	}
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
}
