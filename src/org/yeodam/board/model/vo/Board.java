package org.yeodam.board.model.vo;

import java.sql.Date;

public class Board {
	private int readCount;
	private int boardNo;
	private String boardContent;
	private String filename;
	private String filepath;
	private Date boardDate;
	private String memberId;
	private String boardTitle;
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Board(int readCount, int boardNo, String boardContent, String filename, String filepath, Date boardDate,
			String memberId, String boardTitle) {
		super();
		this.readCount = readCount;
		this.boardNo = boardNo;
		this.boardContent = boardContent;
		this.filename = filename;
		this.filepath = filepath;
		this.boardDate = boardDate;
		this.memberId = memberId;
		this.boardTitle = boardTitle;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
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
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
}