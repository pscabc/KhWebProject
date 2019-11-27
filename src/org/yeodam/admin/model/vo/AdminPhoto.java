package org.yeodam.admin.model.vo;

public class AdminPhoto {
	private int rnum;	// 게시판 번호 추가 생성!
	private int adminPhotoNo;
	private String adminPhotoContent;
	private String adminFilename;
	private String adminFilepath;
	public AdminPhoto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminPhoto(int rnum, int adminPhotoNo, String adminPhotoContent, String adminFilename,
			String adminFilepath) {
		super();
		this.rnum = rnum;
		this.adminPhotoNo = adminPhotoNo;
		this.adminPhotoContent = adminPhotoContent;
		this.adminFilename = adminFilename;
		this.adminFilepath = adminFilepath;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getAdminPhotoNo() {
		return adminPhotoNo;
	}
	public void setAdminPhotoNo(int adminPhotoNo) {
		this.adminPhotoNo = adminPhotoNo;
	}
	public String getAdminPhotoContent() {
		return adminPhotoContent;
	}
	public void setAdminPhotoContent(String adminPhotoContent) {
		this.adminPhotoContent = adminPhotoContent;
	}
	public String getAdminFilename() {
		return adminFilename;
	}
	public void setAdminFilename(String adminFilename) {
		this.adminFilename = adminFilename;
	}
	public String getAdminFilepath() {
		return adminFilepath;
	}
	public void setAdminFilepath(String adminFilepath) {
		this.adminFilepath = adminFilepath;
	}
	
	
}
	
